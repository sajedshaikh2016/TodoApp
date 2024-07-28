//
//  TodoAppUITests.swift
//  TodoAppUITests
//
//  Created by Sajed Shaikh on 28/07/24.
//

import XCTest

final class when_app_is_launched: XCTestCase {
    
    func test_should_not_display_any_task() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let taskList = app.tables["taskList"]
        XCTAssertEqual(0, taskList.cells.count)
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
    
}

final class when_user_saves_a_new_task: XCTestCase {
    
    func test_should_be_able_to_display_task_successfully() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let titleTextField = app.textFields["titleTextField"]
        titleTextField.tap()
        titleTextField.typeText("Mow the lawn")
        
        let saveTaskButton = app.buttons["saveTaskButton"]
        saveTaskButton.tap()
        
        let taskList = app.tables["taskList"]
        XCTAssertEqual(1, taskList.cells.count)
    }
    
    func test_display_the_error_message_for_duplicate_title_task() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let titleTextField = app.textFields["titleTextField"]
        titleTextField.tap()
        titleTextField.typeText("Mow the lawn")
        
        let saveTaskButton = app.buttons["saveTaskButton"]
        saveTaskButton.tap()
        
        titleTextField.tap()
        titleTextField.typeText("Mow the lawn")
        
        saveTaskButton.tap()
        
        let taskList = app.tables["taskList"]
        XCTAssertEqual(1, taskList.cells.count)
        
        let messageText = app.staticTexts["messageText"]
        XCTAssertEqual(messageText.label, "Task is already added")
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
    
}
