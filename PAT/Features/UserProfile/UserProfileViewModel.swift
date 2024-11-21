//
//  UserProfileViewModel.swift
//  PAT
//
//  Created by Tatsuya Kaneko on 20/11/2024.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    
    private let userNetworkService = UserNetworkService()
    
    @Published var user: User?
    
    func load(userID: Int) {
        userNetworkService.getUser(id: userID, completion: { user in
            self.user = user
        })
    }
}

final class UserNetworkService {
    
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
