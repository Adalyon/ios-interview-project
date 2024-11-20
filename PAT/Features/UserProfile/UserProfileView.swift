//
//  UserProfileView.swift
//  PAT
//
//  Created by Tatsuya Kaneko on 20/11/2024.
//

import SwiftUI

struct UserProfileView: View {
    
    @ObservedObject var viewModel: UserProfileViewModel
    
    var body: some View {
        VStack {
            if let user = viewModel.user {
                Text(user.name)
            } else {
                Text("No user found")
            }
        }
        .onAppear {
            viewModel.load()
        }
    }
}
