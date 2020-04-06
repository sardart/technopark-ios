//
//  ViewController.swift
//  Lecture7App
//
//  Created by Artur Sardaryan on 4/6/20.
//  Copyright © 2020 Artur Sardaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let magicView = MagicView()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        view.addSubview(magicView)
        view.addSubview(button)
        
        magicView.backgroundColor = .red
        magicView.image = UIImage(named: "s1200-4")
        
        button.setTitle("Test", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        layout()
    }

    private func layout() {
        magicView.translatesAutoresizingMaskIntoConstraints = false
        magicView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        magicView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        magicView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        magicView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
    }

    @objc
    private func didTapButton() {
        let secondViewController = SecondViewController()
        
        present(secondViewController, animated: true, completion: nil)
    }
}


final class MagicView: UIView {
    var image: UIImage? {
        set {
            imageView.image = newValue
        }
        get {
            imageView.image
        }
    }
    
    private let imageView = UIImageView()
    private let imageViewContainer = UIView()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    

    private func setup() {
        imageView.isUserInteractionEnabled = true
        
        addSubview(imageViewContainer)
        imageViewContainer.addSubview(imageView)
        
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panPiece))
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationPiece))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchPiece))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPiece))
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressPiece))
        longPressGesture.minimumPressDuration = 1
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapPiece))
        doubleTapGesture.numberOfTapsRequired = 2
        
        [panRecognizer, rotationGesture, pinchGesture, tapGesture, longPressGesture, doubleTapGesture].forEach {
            $0.delegate = self
            imageView.addGestureRecognizer($0)
        }

        layout()
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
            let translation = gestureRecognizer.translation(in: gestureRecognizer.view?.superview)
            gestureRecognizer.view?.center.x += translation.x
            gestureRecognizer.view?.center.y += translation.y
            gestureRecognizer.setTranslation(.zero, in: gestureRecognizer.view)
        }
    }

    @objc
    private func tapPiece(_ gestureRecognizer: UITapGestureRecognizer) {
        print("\(#function)")
    }
    
    @objc
    private func longPressPiece(_ gestureRecognizer: UILongPressGestureRecognizer) {
        print("\(#function)")
    }
    
    @objc
    private func doubleTapPiece(_ gestureRecognizer: UITapGestureRecognizer) {
        print("\(#function)")
    }
    
    private func layout() {
        imageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        imageViewContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageViewContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageViewContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: imageViewContainer.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: imageViewContainer.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: imageViewContainer.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: imageViewContainer.bottomAnchor).isActive = true
    }
}

extension MagicView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
