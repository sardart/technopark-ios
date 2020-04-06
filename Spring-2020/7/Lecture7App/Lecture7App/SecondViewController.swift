//
//  SecondViewController.swift
//  Lecture7App
//
//  Created by Artur Sardaryan on 4/6/20.
//  Copyright © 2020 Artur Sardaryan. All rights reserved.
//

import UIKit
import PinLayout

class SecondViewController: UIViewController {
    
    let testView = DrawRectTestView()
    let closeButton = UIButton()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        closeButton.backgroundColor = .red
        closeButton.layer.cornerRadius = 8
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        
        label.text = "hello"
        
        [testView, closeButton, label].forEach { view.addSubview($0) }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        testView.pin.all()
        
        closeButton.pin
            .bottom(view.pin.safeArea.bottom + 16)
            .horizontally(16)
            .height(40)
        
        label.pin.above(of: closeButton, aligned: .center)
            .height(20)
            .sizeToFit(.height)
    }
    
    @objc
    private func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}


final class DrawRectTestView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let startColor: UIColor = .purple
        let endColor: UIColor = .green
        
        let colors = [startColor.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0, 1]
        
        guard let gradient = CGGradient(colorsSpace: colorSpace,
                                        colors: colors as CFArray,
                                        locations: locations) else {
                                            return
        }
        
        let startPoint = CGPoint(x: 0, y: bounds.height / 2)
        let endPoint = CGPoint(x: bounds.width, y: bounds.height / 2)
        
        context?.drawLinearGradient(gradient,
                                    start: startPoint,
                                    end: endPoint,
                                    options: [])
        
        let pathRect = CGRect(x: 24, y: 24, width: 30, height: 30)
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 12)
        
        UIColor.blue.setFill()
        path.fill()
        
        UIColor.red.setStroke()
        path.lineWidth = 3
        path.stroke()
    }
}
