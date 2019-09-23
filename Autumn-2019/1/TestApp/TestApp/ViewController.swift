//
//  ViewController.swift
//  TestApp
//
//  Created by Artur Sardaryan on 9/23/19.
//  Copyright © 2019 Artur Sardaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    private let superButton = UIButton()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // animation
        
        textLabel.alpha = 0
        
        let scaleDuration: TimeInterval = 0.4
        let textAnimationDuration: TimeInterval = 0.3
        let delay: TimeInterval = 1.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            UIView.animate(withDuration: scaleDuration, animations: {
                self.logoImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: { (_) in
                UIView.animate(withDuration: textAnimationDuration) {
                    self.textLabel.center.y -= 40
                    self.textLabel.alpha = 1
                }
            })
        }
        
        // super button stuff
        
        view.addSubview(superButton)
        
        let image = UIImage(named: "logo")
        let buttonWidth = image?.size.width ?? 20
        let buttonHeight = image?.size.height ?? 20

        superButton.frame = CGRect(x: view.bounds.midX - buttonWidth / 2,
                                   y: view.bounds.minY + 20,
                                   width: buttonWidth,
                                   height: buttonHeight)
        
        superButton.setBackgroundImage(image, for: .normal)
        superButton.layer.cornerRadius = 8
        superButton.addTarget(self, action: #selector(superButtonTapped), for: .touchUpInside)
//        superButton.setTitle("super button", for: .normal)
//        superButton.backgroundColor = #colorLiteral(red: 0.4291699231, green: 0.694360435, blue: 0.9999806285, alpha: 1)
    }
    
    @objc
    private func superButtonTapped() {
        print("button tapped")
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        
        present(viewController, animated: true, completion: nil)
    }
}
