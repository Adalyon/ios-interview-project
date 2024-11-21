//
//  UserService.swift
//  PAT
//
//  Created by Tatsuya Kaneko on 21/11/2024.
//

import Foundation

final class MockUserProfileService {
    
    func getUser(id: Int, completion: @escaping (User?) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            completion(User(id: id, name: "User \(id)"))
        }
    }
}

final class UserProfileService {
    
    private let networkService = NetworkService()
    
    func getUser(id: Int, completion: @escaping (User?) -> Void){
        let request = UserRequest(userID: id)
        networkService.performRequest(request: request) { result in
            switch result {
            case .success(let response):
                completion(response as? User)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}
