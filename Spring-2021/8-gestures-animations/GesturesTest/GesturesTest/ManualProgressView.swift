//
//  ManualProgressView.swift
//  GesturesTest
//
//  Created by Artur Sardaryan on 5/5/21.
//

import UIKit

final class ManualProgressView: UIView {
    var progress: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let cornerRadius: CGFloat = 8
        let backgroundColor = UIColor.systemGray
        let progressColor = UIColor.systemIndigo
        
        UIColor.systemBackground.setFill()
        UIRectFill(rect)
        
        let backgroundPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        backgroundColor.setFill()
        backgroundPath.fill()
        
        guard progress > 0 else {
            return
        }
        
        let progressRect = CGRect(x: 0, y: 0, width: rect.width * progress, height: rect.height)
        let progressPath = UIBezierPath(roundedRect: progressRect, cornerRadius: cornerRadius)
        progressColor.setFill()
        progressPath.fill()
    }
}
