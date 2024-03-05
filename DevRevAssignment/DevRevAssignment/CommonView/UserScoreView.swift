//
//  UserScoreView.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 05/03/24.
//

import Foundation
import UIKit

class UserScoreView: UIView {
    
    private var scoreLabel: UILabel!
    private var progressLayer: CAShapeLayer!
    private var trackLayer: CAShapeLayer!
    
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "\(score)%"
            updateProgressLayer()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {

        trackLayer = createCircularLayer(strokeColor: UIColor.lightGray.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: 5.0)
        layer.addSublayer(trackLayer)
        
        progressLayer = createCircularLayer(strokeColor: UIColor.green.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: 5.0)
        layer.addSublayer(progressLayer)
        
        scoreLabel = UILabel()
        scoreLabel.text = "\(score)%"
        scoreLabel.textColor = .white
        scoreLabel.textAlignment = .center
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 14) // Smaller font size to fit the label
        scoreLabel.adjustsFontSizeToFitWidth = true
        addSubview(scoreLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scoreLabel.frame = bounds
        
        let radius = bounds.width / 2 - trackLayer.lineWidth / 2
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: radius, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        progressLayer.path = circularPath.cgPath
    }
    
    private func createCircularLayer(strokeColor: CGColor, fillColor: CGColor, lineWidth: CGFloat) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.strokeColor = strokeColor
        layer.fillColor = fillColor
        layer.lineWidth = lineWidth
        layer.lineCap = .round
        return layer
    }
    
    private func updateProgressLayer() {
        progressLayer.strokeEnd = CGFloat(score) / 100
    }
    

    func animateToScore(_ score: Int) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = CGFloat(score) / 100
        basicAnimation.duration = 0.5 // Shorter duration for a small view
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        progressLayer.add(basicAnimation, forKey: "basicAnimation")
    }
}
