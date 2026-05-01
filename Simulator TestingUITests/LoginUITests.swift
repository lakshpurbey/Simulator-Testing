//
//  LoginUITests.swift
//  Simulator Testing
//
//  Created by Laksh Purbey on 01/05/26.
//

import XCTest

final class LoginUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testLoginFlow() {
        let username = app.textFields["usernameField"]
        XCTAssertTrue(username.waitForExistence(timeout: 5))
        username.tap()
        username.typeText("testUser")
        
        let password = app.secureTextFields["passwordField"]
        password.tap()
        password.typeText("1234")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let welcome = app.staticTexts["Welcome"]
        XCTAssertTrue(welcome.waitForExistence(timeout: 5))
        
    }
}
