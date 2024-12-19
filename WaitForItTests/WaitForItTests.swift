//
//  WaitForItTests.swift
//  WaitForItTests
//
//  Created by Shane Mraz on 12/18/24.
//

import Testing
@testable import WaitForIt


// https://www.avanderlee.com/concurrency/unit-testing-async-await/

struct WaitForItTests {

    @Test func getJoke() async throws {
        let sut = JokeService()
        
        let task = Task {
            try await sut.fetchJoke()
        }
        
        // https://www.swiftwithvincent.com/blog/how-to-get-started-with-swift-testing
        await #expect(task.result != nil)
    }

}
