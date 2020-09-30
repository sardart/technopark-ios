//
//  ViewController.swift
//  TestApp1
//
//  Created by Artur Sardaryan on 9/28/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 0.5) {
                self.logoImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.titleLabel.alpha = 1
                self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -30)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    UIView.animate(withDuration: 0.5) {
                        self.logoImageView.transform = .identity
                    }
                }
            }
        }
    }
}

