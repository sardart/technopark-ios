//
//  CityViewController.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 10/19/20.
//

import UIKit
import PinLayout

class CityViewController: UIViewController {
    private let dataLoader = DataLoader()
    
    private let imageView = UIImageView()
    private let progressView = ProgressView()
    private let manualProgressView = ManualProgressView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLoader.delegate = self
        
        imageView.image = UIImage(named: "cloudy")
        
        view.backgroundColor = .systemBackground
        progressView.backgroundColor = .systemBackground
        manualProgressView.backgroundColor = .systemBackground

        view.addSubview(imageView)
        view.addSubview(progressView)
        view.addSubview(manualProgressView)
        
        progressView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapProgress)))
    }
    
    @objc
    private func didTapProgress() {
        progressView.start()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.pin.size(100).vCenter().hCenter(-50)
        
        progressView.pin.height(40).top(view.pin.safeArea.top + 24).horizontally(16)
        
        manualProgressView.pin.height(40).bottom(view.pin.safeArea.bottom + 24).horizontally(16)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.toValue = NSNumber(value: 2)
        
        let translationAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        translationAnimation.toValue = NSNumber(value: 100)
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.toValue = NSNumber(value: 0.3)
        
        let animationGroup = CAAnimationGroup()
        
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity
        animationGroup.autoreverses = true
        animationGroup.animations = [scaleAnimation, translationAnimation, opacityAnimation]
        
        imageView.layer.add(animationGroup, forKey: nil)
        
        progressView.start()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        progressView.pause()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        progressView.resume()
    }
}

extension CityViewController: DataLoaderDelegate {
    func dataLoader(_ dataLoader: DataLoader, didUpdate progress: CGFloat) {
        manualProgressView.progress = progress
    }
}

protocol ProgressProtocol: class {
    func start()
    func reset()
    func pause()
    func resume()
}

final class ProgressView: UIView {
    var displayLink: CADisplayLink?
    
    private var startTime = CFAbsoluteTimeGetCurrent()
    private var pauseTime: CFAbsoluteTime?
    private var duration: TimeInterval = 5
    
    private var progress: CGFloat = 0
    
    @objc
    private func handleDisplayLink() {
        let value = CGFloat((CFAbsoluteTimeGetCurrent() - startTime) / duration)
        
        progress = value
        
        guard value < 1 else {
            progress = 1
            displayLink?.invalidate()
            displayLink = nil
            return
        }
        
        progress = value
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let cornerRadius: CGFloat = 8
        let backgroundColor: UIColor = .gray
        let progressColor: UIColor = .systemIndigo
        
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

extension ProgressView: ProgressProtocol {
    func start() {
        displayLink = CADisplayLink(target: self, selector: #selector(handleDisplayLink))
        displayLink?.add(to: .main, forMode: .common)
        startTime = CFAbsoluteTimeGetCurrent()
    }
    
    func reset() {
        progress = 0
        displayLink?.invalidate()
        displayLink = nil
    }
    
    func pause() {
        displayLink?.isPaused = true
        pauseTime = CFAbsoluteTimeGetCurrent()
    }
    
    func resume() {
        displayLink?.isPaused = false
        if let pauseTime = pauseTime {
            startTime += CFAbsoluteTimeGetCurrent() - pauseTime
            self.pauseTime = nil
        }
    }
}

final class ManualProgressView: UIView {
    var progress: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let cornerRadius: CGFloat = 8
        let backgroundColor: UIColor = .gray
        let progressColor: UIColor = .systemIndigo
        
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

protocol DataLoaderDelegate: class {
    func dataLoader(_ dataLoader: DataLoader, didUpdate progress: CGFloat)
}

final class DataLoader {
    weak var delegate: DataLoaderDelegate?
    var timer: Timer?
    
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
            guard let self = self else {
                return
            }
            
            self.delegate?.dataLoader(self, didUpdate: CGFloat.random(in: 0...1))
        })
        
        timer?.fire()
    }
}

