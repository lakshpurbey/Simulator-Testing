//
//  LoginViewModelTests.swift
//  Simulator Testing
//
//  Created by Laksh Purbey on 01/05/26.
//

import XCTest
@testable import Simulator_Testing

final class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        
        viewModel = LoginViewModel()
    }
    
    func testLoginSucess() {
        
        let result = viewModel.login(username: "test", password: "1234")
        XCTAssertTrue(result)
    }
    
    func testLoginFailure() {
        let result = viewModel.login(username: "", password: "")
        XCTAssertFalse(result)
        
    }
}

