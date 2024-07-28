//
//  Springboard.swift
//  TodoAppUITests
//
//  Created by Sajed Shaikh on 28/07/24.
//

import Foundation
import XCTest

class Springboard {
    
    static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    
    class func deleteApp() {
        
        XCUIApplication().terminate()
        springboard.activate()
        
        let appIcon = springboard.icons.matching(identifier: "TodoApp").firstMatch
        appIcon.press(forDuration: 1.3)
        
        let _ = springboard.buttons["Remove App"].waitForExistence(timeout: 1.0)
        springboard.buttons["Remove App"].tap()
        
        let deleteAppButton = springboard.alerts.buttons["Delete App"].firstMatch
        
        if deleteAppButton.waitForExistence(timeout: 5) {
            deleteAppButton.tap()
            springboard.alerts.buttons["Delete"].tap()
        }
        
    }
    
}
