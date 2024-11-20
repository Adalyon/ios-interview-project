//
//  ContentView.swift
//  PAT
//
//  Created by Tatsuya Kaneko on 20/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        UserProfileView(
            viewModel: UserProfileViewModel(
                userID: 1
            )
        )
    }
}

#Preview {
    ContentView()
}
