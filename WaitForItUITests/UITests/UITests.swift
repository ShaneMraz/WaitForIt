//
//  UITests.swift
//  WaitForIt
//
//  Created by Shane Mraz on 12/18/24.
//

import XCTest

class UITests: XCTestCase {
    var app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
        super.tearDown()
    }
}
