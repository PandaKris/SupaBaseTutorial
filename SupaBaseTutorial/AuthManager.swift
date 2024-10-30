//
//  AuthManager.swift
//  SupaBaseTutorial
//
//  Created by Kristanto Sean on 30/10/24.
//

import Foundation
import Supabase

class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://bpfsgtxudumtrpqadahu.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJwZnNndHh1ZHVtdHJwcWFkYWh1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzAyNTYyMjgsImV4cCI6MjA0NTgzMjIyOH0.03FEoFsjmW3R9Uj3nD7_4CMGx5vrHAlu2ZktL0waN8g")
    
        
    func signInWithApple(idToken: String, nonce: String) async throws {
        let credentials = OpenIDConnectCredentials(provider: .apple, idToken: idToken, nonce: nonce)
        let session = try await client.auth.signInWithIdToken(credentials: credentials)
        
        print(session)
        print(session.user)
    }
    
    func logoutFromApple() async throws {
        try await client.auth.signOut()
    }
}
