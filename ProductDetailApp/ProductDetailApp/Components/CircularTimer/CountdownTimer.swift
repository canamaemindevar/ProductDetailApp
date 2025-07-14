//
//  CircularTimerLogic.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//
import Foundation

protocol CountdownTimerDelegate: AnyObject {
    func countdownDidUpdate(remaining: Int, progress: Double)
    func countdownDidFinish()
}

final class CountdownTimer {
    weak var delegate: CountdownTimerDelegate?
    
    var timer: Timer?
    let duration: Int
    var remaining: Int
    
    init(duration: Int) {
        self.duration = duration
        self.remaining = duration
    }
}

private extension CountdownTimer {
    
    func notifyDelegate() {
        let progress = Double(duration - remaining) / Double(duration)
        delegate?.countdownDidUpdate(remaining: remaining, progress: progress)
    }
    
    func tick() {
        guard remaining > 0 else {
            stop()
            delegate?.countdownDidFinish()
            return
        }
        
        remaining -= 1
        notifyDelegate()
    }
}

extension CountdownTimer {
    
    func start() {
        stop()
        notifyDelegate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func reset() {
        stop()
        self.remaining = duration
        self.delegate?.countdownDidUpdate(remaining: remaining, progress: 0)
    }
}
