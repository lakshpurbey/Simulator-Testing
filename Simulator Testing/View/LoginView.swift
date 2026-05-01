//
//  LoginView.swift
//  Simulator Testing
//
//  Created by Laksh Purbey on 01/05/26.
//

import SwiftUI

struct LoginView: View {

    @State private var username = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack(spacing: 20) {

            Spacer()

            // MARK: - Title
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.bold)

            // MARK: - Username
            TextField("Username", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .accessibilityIdentifier("usernameField")

            // MARK: - Password
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .accessibilityIdentifier("passwordField")

            // MARK: - Error
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            
            if isLoggedIn {
                Text("Welcome")
                    .accessibilityIdentifier("welcomeText")
            } else {
                // existing login UI
            }

            // MARK: - Login Button
            Button(action: loginAction) {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .accessibilityIdentifier("loginButton")

            Spacer()
        }
        .padding()
    }

    // MARK: - Action
    private func loginAction() {
        errorMessage = nil
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading = false

            if username == "testUser" && password == "1234" {
                isLoggedIn = true

                print("Login Success")
            } else {
                errorMessage = "Invalid credentials"
            }
        }
    }
}
