//
//  ViewController.swift
//  GestureRecognizers
//
//  Created by Artur Sardaryan on 11/5/19.
//  Copyright © 2019 Artur Sardaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let magicView = MagicView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        magicView.backgroundColor = .red
        magicView.image = UIImage(named: "s1200")
        
        view.addSubview(magicView)
//        magicView.clipsToBounds = true
        layout()
    }
    
    func layout() {
        magicView.translatesAutoresizingMaskIntoConstraints = false
        magicView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        magicView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        magicView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        magicView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

final class MagicView: UIView {
    private let imageView = UIImageView()
    private let imageContainerView = UIView()
    
    var image: UIImage? {
        set {
            imageView.image = newValue
        }
        get {
            return imageView.image
        }
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        
        let doubleTapGestureRecongnizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapPiece))
        doubleTapGestureRecongnizer.numberOfTapsRequired = 2
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panPiece))
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinchPiece))
        let rotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotationPiece))
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressPiece))
        longPressGestureRecognizer.minimumPressDuration = 1
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipePiece))
        swipeGestureRecognizer.direction = .down
        
        [doubleTapGestureRecongnizer,
         pinchGestureRecognizer,
         rotationGestureRecognizer,
         panGestureRecognizer,
         longPressGestureRecognizer, swipeGestureRecognizer].forEach {
            imageView.addGestureRecognizer($0)
            $0.delegate = self
        }
        
        imageContainerView.addSubview(imageView)
        addSubview(imageContainerView)
        layout()
    }
    
    private func layout() {
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: imageContainerView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor).isActive = true
    }
    
    @objc
    private func doubleTapPiece(_ gestureRecognizer: UITapGestureRecognizer) {
        print("\(#function)")
    }
    
    @objc
    private func longPressPiece(_ gestureRecognizer: UILongPressGestureRecognizer) {
        print("\(#function)")
    }
    
    @objc
    private func swipePiece(_ gestureRecognizer: UILongPressGestureRecognizer) {
        print("\(#function)")
    }
    
    @objc
    private func pinchPiece(_ gestureRecognizer: UIPinchGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale) ?? .identity
            gestureRecognizer.scale = 1.0
        }
    }
    
    @objc
    private func rotationPiece(_ gestureRecognizer: UIRotationGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = gestureRecognizer.view?.transform.rotated(by: gestureRecognizer.rotation) ?? .identity
            gestureRecognizer.rotation = 0
        }
    }
    
    @objc
    private func panPiece(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let translation: CGPoint = gestureRecognizer.translation(in: gestureRecognizer.view?.superview)
            gestureRecognizer.view?.center.x += translation.x
            gestureRecognizer.view?.center.y += translation.y
            gestureRecognizer.setTranslation(.zero, in: gestureRecognizer.view?.superview)
        }
    }
}

extension MagicView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
