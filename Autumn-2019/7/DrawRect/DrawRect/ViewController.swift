//
//  ViewController.swift
//  DrawRect
//
//  Created by Artur Sardaryan on 11/5/19.
//  Copyright © 2019 Artur Sardaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let customView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customView)
        customView.frame = view.frame
    }


}

final class CustomView: UIView {
    override func draw(_ rect: CGRect) {
        // gradient
        let context = UIGraphicsGetCurrentContext()

        let startColor: UIColor = .green
        let endColor: UIColor = .purple

        let colors = [startColor.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0, 1]

        guard let gradient = CGGradient(colorsSpace: colorSpace,
                                        colors: colors as CFArray,
                                        locations: colorLocations) else {
                                            return
        }

        let startPoint = CGPoint(x: 0, y: bounds.height / 2)
        let endPoint = CGPoint(x: bounds.width, y: bounds.height / 2)

        context?.drawLinearGradient(gradient,
                                    start: startPoint,
                                    end: endPoint,
                                    options: [])
        
        let pathRect = CGRect(x: 24, y: 48, width: 128, height: 64)
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 8)
        
        UIColor.blue.setFill()
        path.fill()

        UIColor.yellow.setStroke()
        path.lineWidth = 4
        path.stroke()
        
        UIColor.red.setFill()
        let circleCenter = CGPoint(x: rect.midX, y: 150)
        let circlePath = UIBezierPath(arcCenter: circleCenter,
                                      radius: rect.width / 3,
                                      startAngle: 0,
                                      endAngle: .pi / 2,
                                      clockwise: true)
        circlePath.fill()

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let linePath = UIBezierPath()
        linePath.move(to: center)
        linePath.addLine(to: CGPoint(x: rect.midX + 100, y: rect.midY))
        linePath.lineWidth = 4
        linePath.stroke()
    }
    
    private func setupViews() {
        let view = UIView()
        
        view.backgroundColor = .yellow
        addSubview(view)
        view.frame = self.frame
        view.layer.cornerRadius = view.frame.size.width / 2
        view.layer.borderColor = UIColor.black.cgColor
    }
}
