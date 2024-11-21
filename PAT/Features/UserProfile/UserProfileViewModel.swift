//
//  UserProfileViewModel.swift
//  PAT
//
//  Created by Tatsuya Kaneko on 20/11/2024.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    
    private let userNetworkService = MockUserProfileService()
    
    @Published var user: User?
    
    func load(userID: Int) {
        userNetworkService.getUser(id: userID, completion: { user in
            self.user = user
        })
    }
}
