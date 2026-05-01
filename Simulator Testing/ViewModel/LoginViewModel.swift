//
//  LoginViewModel.swift
//  Simulator Testing
//
//  Created by Laksh Purbey on 01/05/26.
//

import Foundation

final class LoginViewModel {
    
    private let validUsername = "test"
    private let validPassword = "1234"
    
    func login(username: String, password: String) -> Bool {
        return username == validUsername && password == validPassword
    }
    
    // If you want something closer to production (with async + API simulation):
    func login(username: String,
               password: String,
               completion: @escaping (Bool) -> Void) {
        
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0 ) {
            
            let sucess = (username == "test" && password == "pasword")
            
            DispatchQueue.main.async {
                completion(sucess)
            }
                
        }
        
    }
}
