//
//  ViewController.swift
//  GesturesTest
//
//  Created by Artur Sardaryan on 12/14/20.
//

import UIKit

class ViewController: UIViewController {
    
    private let testView = TestView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(testView)
                
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        testView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        testView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        testView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

final class TestView: UIView {
    private let imageView = UIImageView()
    private let imageContainerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    private func setup() {
        imageView.image = UIImage(named: "risovach.ru-90")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageContainerView)
        imageContainerView.addSubview(imageView)
        
        layout()
        addRecognizers()
    }
    
    private func addRecognizers() {
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation))
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        let doubleRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleRecognizer.numberOfTapsRequired = 2
        
        [pinchRecognizer, rotationRecognizer, panRecognizer, doubleRecognizer].forEach {
            imageView.addGestureRecognizer($0)
            $0.delegate = self
        }
    }
    
    @objc
    private func handlePinch(_ gestureRecognizer : UIPinchGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale) ?? .identity
            gestureRecognizer.scale = 1.0
        }
    }
    
    @objc
    private func handleRotation(_ gestureRecognizer : UIRotationGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = gestureRecognizer.view?.transform.rotated(by: gestureRecognizer.rotation) ?? .identity
            gestureRecognizer.rotation = 0
        }
    }
    
    @objc
    private func handlePan(_ gestureRecognizer : UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: gestureRecognizer.view?.superview)
        gestureRecognizer.view?.center.x += translation.x
        gestureRecognizer.view?.center.y += translation.y
        gestureRecognizer.setTranslation(.zero, in: gestureRecognizer.view)
    }
    
    @objc
    private func handleDoubleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5) {
            gestureRecognizer.view?.transform = .identity
            self.imageView.frame = self.bounds
        }
    }
    
    private func layout() {
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        imageContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: imageContainerView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TestView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
