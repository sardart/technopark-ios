//
//  ViewController.swift
//  lecture3App
//
//  Created by Artur Sardaryan on 10/7/19.
//  Copyright © 2019 Artur Sardaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var moreButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupImageView()
    }
    
    private func setupButtons() {
//        buttons.forEach {
//            $0.backgroundColor = .blue
//            $0.layer.cornerRadius = 8
//            $0.setTitle("button \(index)", for: .normal)
//            $0.tintColor = .white
//        }
        
        for (index, button) in buttons.enumerated() {
            if index % 2 == 0 {
                button.backgroundColor = .blue
                button.layer.cornerRadius = 8
                button.setTitle("button \(index)", for: .normal)
                button.tintColor = .white
            } else {
                button.backgroundColor = .white
                button.layer.cornerRadius = 8
                button.setTitle("button \(index)", for: .normal)
                button.tintColor = .black
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.gray.cgColor
            }
        }
        
        moreButton.tintColor = .black
        moreButton.layer.borderWidth = 1
        moreButton.layer.cornerRadius = 8
        moreButton.tintColor = .black
        moreButton.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setupImageView() {
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
    }

    @IBAction func didTapEditButton(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let editViewController = storyboard.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        
        editViewController.text = "heeeeey"
                
//        editViewController.modalPresentationStyle = .fullScreen
        present(editViewController, animated: true, completion: nil)

//        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "MySegue" {
            guard let destination = segue.destination as? SegueViewController else {
                return
            }
            
            destination.text = "Destination text changed"
        }
    }
}
