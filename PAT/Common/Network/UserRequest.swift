//
//  UserRequest.swift
//  PAT
//
//  Created by Tatsuya Kaneko on 20/11/2024.
//

import Foundation

struct UserRequest: APIRequest {
    typealias Response = User

    var userID: Int

    var urlRequest: URLRequest {
        let url = URL(string: "https://api.example.com/users/\(userID)")!
        return URLRequest(url: url)
    }

    func parseResponse(data: Data) throws -> User {
        return try JSONDecoder().decode(User.self, from: data)
    }
}
