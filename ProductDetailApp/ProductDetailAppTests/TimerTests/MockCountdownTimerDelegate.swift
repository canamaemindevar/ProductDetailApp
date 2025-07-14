//
//  MockCountdownTimerDelegate.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 14.07.2025.
//

import Foundation
@testable import ProductDetailApp

class MockCountdownTimerDelegate: CountdownTimerDelegate {
    var updateCalled = false
    var finishCalled = false
    
    var onCountdownDidUpdate: ((Int, Double) -> Void)?
    var onCountdownDidFinish: (() -> Void)?
    
    func countdownDidUpdate(remaining: Int, progress: Double) {
        updateCalled = true
        onCountdownDidUpdate?(remaining, progress)
    }
    
    func countdownDidFinish() {
        finishCalled = true
        onCountdownDidFinish?()
    }
}
