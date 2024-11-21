//
//  UserProfileView.swift
//  PAT
//
//  Created by Tatsuya Kaneko on 20/11/2024.
//

import SwiftUI

struct UserProfileView: View {
    
    private let userIDs = [0, 1, 2, 3, 4, 5]
    @State private var userID: Int?
    @ObservedObject var viewModel: UserProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // User selection
            Form {
                Section("User selector:") {
                    Picker("Please choose a userID", selection: $userID) {
                        ForEach(userIDs, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                Section("Result") {
                    
                    if let user = viewModel.user {
                        Text("Username: \(user.name)")
                    } else {
                        Text("No user")
                    }
                }
                
                Button(
                    action: {
                        guard let userID else { return }
                        viewModel.load(userID: userID)
                    },
                    label: {
                        Text("Load")
                    }
                )
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
