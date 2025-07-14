//
//  CountdownTimerTests.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 14.07.2025.
//
import XCTest
@testable import ProductDetailApp 

// MARK: - CountdownTimer Tests
class CountdownTimerTests: XCTestCase {
    
    var countdownTimer: CountdownTimer!
    var mockDelegate: MockCountdownTimerDelegate!
    
    override func setUp() {
        super.setUp()
        countdownTimer = CountdownTimer(duration: 5)
        mockDelegate = MockCountdownTimerDelegate()
        countdownTimer.delegate = mockDelegate
    }
    
    override func tearDown() {
        countdownTimer?.stop()
        countdownTimer = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testInitialization() {
        // Given
        let duration = 10
        
        // When
        let timer = CountdownTimer(duration: duration)
        
        // Then
        XCTAssertEqual(timer.duration, duration)
        XCTAssertEqual(timer.remaining, duration)
        XCTAssertNil(timer.timer)
    }
    
    func testStartTimer() {
        // Given
        let expectation = XCTestExpectation(description: "Timer should start and call delegate")
        mockDelegate.onCountdownDidUpdate = { remaining, progress in
            XCTAssertEqual(remaining, 5)
            XCTAssertEqual(progress, 0.0, accuracy: 0.001)
            expectation.fulfill()
        }
        
        // When
        countdownTimer.start()
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(mockDelegate.updateCalled)
    }
    
    func testTimerTick() {
        // Given
        let expectation = XCTestExpectation(description: "Timer should tick and update")
        var updateCount = 0
        
        mockDelegate.onCountdownDidUpdate = { remaining, progress in
            updateCount += 1
            if updateCount == 2 {
                XCTAssertEqual(remaining, 4)
                XCTAssertEqual(progress, 0.2, accuracy: 0.001)
                expectation.fulfill()
            }
        }
        
        // When
        countdownTimer.start()
        
        // Then
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testTimerFinish() {
        // Given
        let timer = CountdownTimer(duration: 1)
        timer.delegate = mockDelegate
        
        let expectation = XCTestExpectation(description: "Timer should finish")
        mockDelegate.onCountdownDidFinish = {
            expectation.fulfill()
        }
        
        // When
        timer.start()
        
        // Then
        wait(for: [expectation], timeout: 2.0)
        XCTAssertTrue(mockDelegate.finishCalled)
    }
    
    func testStopTimer() {
        // Given
        countdownTimer.start()
        
        // When
        countdownTimer.stop()
        
        // Then
        XCTAssertNil(countdownTimer.timer)
    }
    
    func testResetTimer() {
        // Given
        countdownTimer.start()
        
        let expectation = XCTestExpectation(description: "Timer should reset")
        mockDelegate.onCountdownDidUpdate = { remaining, progress in
            if remaining == 5 && progress == 0.0 {
                expectation.fulfill()
            }
        }
        
        // When
        countdownTimer.reset()
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(countdownTimer.remaining, 5)
    }
    
    func testProgressCalculation() {
        // Given
        let timer = CountdownTimer(duration: 10)
        timer.delegate = mockDelegate
        
        var expectedProgress: [Double] = []
        mockDelegate.onCountdownDidUpdate = { remaining, progress in
            expectedProgress.append(progress)
        }
        
        // When
        timer.start()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            XCTAssertEqual(expectedProgress.first!, 0.0, accuracy: 0.001)
            if expectedProgress.count > 1 {
                XCTAssertEqual(expectedProgress[1], 0.1, accuracy: 0.001)
            }
        }
    }
}
