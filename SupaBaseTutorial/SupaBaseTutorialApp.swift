//
//  SupaBaseTutorialApp.swift
//  SupaBaseTutorial
//
//  Created by Kristanto Sean on 30/10/24.
//

import SwiftUI

@main
struct SupaBaseTutorialApp: App {
    
    @StateObject var signInStatus = SignInStatus()
    @State var isLoaded: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLoaded {
                if signInStatus.signedIn {
                    HomeView()
                        .environmentObject(signInStatus)
                } else {
                    SignInView()
                        .environmentObject(signInStatus)
                }
            } else {
                OnboardingView()
                    .onAppear {
                        Task {
                            isLoaded = true
                            if AuthManager.shared.client.auth.currentSession != nil {
                                signInStatus.signedIn = true
                            } else {
                                signInStatus.signedIn = false
                            }
                        }
                    }
            }
                
        }
    }
}
