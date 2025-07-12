//
//  CircularTimerView.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//

import UIKit

protocol CircularTimerViewDelegate: AnyObject {
    func didCountDownFinishCircularTimerView(_ view: CircularTimerView)
}

final class CircularTimerView: UIView {
    
    private let shapeLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    private let label = UILabel()
    
    private var timer: CountdownTimer
    private var config: CircularTimerConfiguration
    private var progress: Double = 0.0 {
        didSet {
            updateProgressLayer()
        }
    }
    
    weak var delegate: CircularTimerViewDelegate?
    
    init(config: CircularTimerConfiguration? = nil,timer: CountdownTimer) {
        self.config = config ?? CircularTimerConfiguration()
        self.timer = timer
        super.init(frame: .zero)
        setupLayers()
        setupLabel()
        timer.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath(arcCenter: centerPoint, radius: bounds.width/2 - config.lineWidth/2, startAngle: -.pi/2, endAngle: 1.5 * .pi, clockwise: true)
        shapeLayer.path = path.cgPath
        backgroundLayer.path = path.cgPath
        shapeLayer.frame = bounds
        backgroundLayer.frame = bounds
        label.frame = bounds
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 50, height: 50)
    }
}


private extension CircularTimerView {
    
    func setupLabel() {
        label.textColor = config.textColor
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        addSubview(label)
    }
    
     func update(remaining: Int, progress: Double) {
        label.text = "\(remaining)"
        self.progress = progress
    }
    
    var centerPoint: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    func updateProgressLayer() {
        shapeLayer.strokeEnd = CGFloat(progress)
    }
    
    func setupLayers() {
        backgroundColor = .clear
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(shapeLayer)
        
        backgroundLayer.strokeColor = UIColor.lightGray.cgColor
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.lineWidth = config.lineWidth

        shapeLayer.strokeColor = config.ringColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = config.lineWidth
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
    }
}

extension CircularTimerView {
    
    func startTimer() {
        timer.start()
    }
    
    func stopTimer() {
        timer.stop()
    }
    
    func resetTimer() {
        timer.reset()
        startTimer()
    }
    
}

extension CircularTimerView: CountdownTimerDelegate {
    
    func countdownDidUpdate(remaining: Int, progress: Double) {
       update(remaining: remaining, progress: progress)
    }
    
    func countdownDidFinish() {
        delegate?.didCountDownFinishCircularTimerView(self)
    }
}
