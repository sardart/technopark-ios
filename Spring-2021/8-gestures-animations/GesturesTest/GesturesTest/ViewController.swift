//
//  ViewController.swift
//  GesturesTest
//
//  Created by Artur Sardaryan on 5/5/21.
//

import UIKit

class ViewController: UIViewController {
    private let magicView = MagicView()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    private func setup() {        
        view.addSubview(magicView)
        view.addSubview(button)
        
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemIndigo.cgColor
        button.setTitleColor(.systemIndigo, for: .normal)
        button.setTitle("Show progress", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        magicView.translatesAutoresizingMaskIntoConstraints = false
        magicView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        magicView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        magicView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        magicView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
        button.frame = CGRect(x: 16, y: view.bounds.height - 100, width: view.bounds.width - 32, height: 48)
    }
    
    @objc
    private func didTapButton() {
        let viewController = ProgressViewController()
        present(viewController, animated: true, completion: nil)
    }
}

final class MagicView: UIView {
    private let imageView = UIImageView()
    private let imageContainerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "shashlindos")
        imageView.contentMode = .scaleAspectFit
        
        imageContainerView.addSubview(imageView)
        addSubview(imageContainerView)
        
        layout()
        addRecognizer()
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
    
    private func addRecognizer() {
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        let rotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        
        [pinchGestureRecognizer, rotationGestureRecognizer, panGestureRecognizer, doubleTapGestureRecognizer].forEach {
            $0.delegate = self
            imageView.addGestureRecognizer($0)
        }
    }
    
    @objc
    private func handlePinch(gestureRecognizer: UIPinchGestureRecognizer) {
        guard gestureRecognizer.state == .began || gestureRecognizer.state == .changed else {
            return
        }
        
        gestureRecognizer.view?.transform = gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale) ?? .identity
        gestureRecognizer.scale = 1.0
    }
    
    @objc
    private func handleRotation(gestureRecognizer: UIRotationGestureRecognizer) {
        guard gestureRecognizer.state == .began || gestureRecognizer.state == .changed else {
            return
        }
        
        gestureRecognizer.view?.transform = gestureRecognizer.view?.transform.rotated(by: gestureRecognizer.rotation) ?? .identity
        gestureRecognizer.rotation = 0
    }
    
    @objc
    private func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: gestureRecognizer.view?.superview)
        gestureRecognizer.view?.center.x += translation.x
        gestureRecognizer.view?.center.y += translation.y
        gestureRecognizer.setTranslation(.zero, in: gestureRecognizer.view)
    }
    
    @objc
    private func handleDoubleTap(gestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5) {
            gestureRecognizer.view?.transform = .identity
            self.imageView.frame = self.bounds
        }
    }
}

extension MagicView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
