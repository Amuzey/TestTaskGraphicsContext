//
//  CircleView.swift
//  TestTaskGraphicsContext
//
//  Created by Алексей on 03.03.2023.
//

import UIKit

class CircleView: UIView {
    
    private var timer: Timer?
    private var yOffset: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        startTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        for i in 1...5 {
            let center = CGPoint(x: i * 50, y: 80 + Int(yOffset))
            let radius = 10.0
            let circleColor = UIColor.black.cgColor
            drawCircle(context: context, center: center, radius: radius, color: circleColor)
        }
    }
    
    private func drawCircle(context: CGContext, center: CGPoint, radius: CGFloat, color: CGColor) {
        context.setFillColor(color)
        context.beginPath()
        context.addArc(center: center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        context.closePath()
        context.fillPath()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0/60.0, repeats: true) { [weak self] _ in
            self?.updateCirclesPosition()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateCirclesPosition() {
        yOffset += 1
        setNeedsDisplay()
    }
    
    deinit {
        stopTimer()
    }
}


