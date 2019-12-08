//
//  ViewController.swift
//  testcvolors
//
//  Created by Artur Sardaryan on 11/12/19.
//  Copyright © 2019 Artur Sardaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(button)
        button.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = .red
    }

    @objc
    func didTapButton() {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)

        alert.view.tintColor = .yellow
        
        alert.addAction(UIAlertAction(title: "Approve", style: .default , handler:{ (UIAlertAction)in
            print("User click Approve button")
        }))

        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }

}

