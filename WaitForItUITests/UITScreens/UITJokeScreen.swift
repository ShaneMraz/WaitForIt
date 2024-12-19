//
//  UITJokeScreen.swift
//  WaitForIt
//
//  Created by Shane Mraz on 12/18/24.
//

import XCTest

struct UITJokeScreen: Screen {
    let app: XCUIApplication
    
    
    @discardableResult
    
    func verifyJokeScreen() -> Self {
        let jokeScreen = app.staticTexts.matching(identifier: "jokeTitle")
        
        XCTAssertTrue(jokeScreen.element.waitForExistence(timeout: 3))
        
        return self
    }
    
    
    func storeCurrentJoke() -> String {
        let jokeContent = app.staticTexts.matching(identifier: "jokeContent")
    
        XCTAssertTrue(jokeContent.element.waitForExistence(timeout: 3))
        
        let joke = jokeContent.element.label
        
        return joke
    }
    
    func pullToRefresh() -> Self {
        let jokeScreen = app.staticTexts.matching(identifier: "jokeTitle")
        
        let start = jokeScreen.element.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = jokeScreen.element.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 15))
        
        start.press(forDuration: 0, thenDragTo: finish)
        
        return self
    }
    
    func verifyNewJoke(_ initialJoke: String) {
        let newJoke = app.staticTexts.matching(identifier: "jokeContent").element.label
        
        XCTAssertNotEqual(initialJoke, newJoke)
    }
}
