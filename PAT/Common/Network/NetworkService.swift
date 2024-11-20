//
//  NetworkService.swift
//  PAT
//
//  Created by Tatsuya Kaneko on 20/11/2024.
//

import Foundation

enum NetworkError: Error {
    case decoding
    case invalidResponse
    case network
}

protocol APIRequest {
    associatedtype Response
    var urlRequest: URLRequest { get }
    func parseResponse(data: Data) throws -> Response
}

final class NetworkService {
    func performRequest(request: any APIRequest, completion: @escaping (Result<Any, Error>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: request.urlRequest) { data, response, error in
            guard error == nil else {
                completion(.failure(NetworkError.network))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            do {
                let result = try request.parseResponse(data: data)
                completion(.success(result))
            } catch {
                completion(.failure(NetworkError.decoding))
            }
        }
        task.resume()
    }
}
