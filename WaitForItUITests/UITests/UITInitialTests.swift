//
//  UITInitialTests.swift
//  WaitForIt
//
//  Created by Shane Mraz on 12/18/24.
//

import XCTest

final class UITInitialTests: UITests {
    
    func test_verifyJokeScreen() {
        UITJokeScreen(app: app)
            .verifyJokeScreen()
    }
    
    func test_refreshJokeScreen() {
        UITJokeScreen(app: app)
            .verifyJokeScreen()
        
        let initialJoke = UITJokeScreen(app: app).storeCurrentJoke()
        
        UITJokeScreen(app: app)
            .pullToRefresh()
            .verifyNewJoke(initialJoke)
    }
}
