//
//  ContentView.swift
//  SupaBaseTutorial
//
//  Created by Kristanto Sean on 30/10/24.
//

import SwiftUI

struct SignInView: View {
        
    let signInApple = SignInAppleUtils()
    @EnvironmentObject var signInStatus: SignInStatus

    
    var body: some View {
        VStack {
            Button {
                signInApple.startSignInWithAppleFlow { result in
                    switch result {
                        case .success(let appleResult):
                        Task {
                            try await AuthManager.shared.signInWithApple(idToken: appleResult.idToken, nonce: appleResult.nonce)
                            
                            signInStatus.signedIn = true
                        }
                        case .failure(_):
                            print("error")
                    }
                }
            } label: {
                Text("Sign in With Apple")
            }
        }
        .padding()
    }
}

#Preview {
    SignInView()
}
