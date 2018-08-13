//
//  CanvasView.swift
//  drawingWritingRecognitionTest
//
//  Created by Josh Jaslow on 4/8/18.
//  Copyright © 2018 Jaslow Enterprises. All rights reserved.
//

import UIKit

@IBDesignable
class CanvasView: UIView {
    
    @IBInspectable var width: Int = 10 {
        didSet { lineWidth = CGFloat(width) } }
    
    @IBInspectable var lineColor: UIColor! = .white
    var lineWidth: CGFloat!
    var path: UIBezierPath!
    var touchPoint: CGPoint!
    var startingPoint: CGPoint!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
        
        lineWidth = CGFloat(width)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    
    func drawShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
    func clearCanvas() {
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }

}
