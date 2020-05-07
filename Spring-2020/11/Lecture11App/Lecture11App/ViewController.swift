//
//  ViewController.swift
//  Lecture11App
//
//  Created by Artur Sardaryan on 5/7/20.
//  Copyright © 2020 Artur Sardaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    private let imagePicker = UIImagePickerController()
    
    private var dataManager: ProfileDataManager = CoreDataProfileDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.layer.masksToBounds = true
        
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 8
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        imageView.image = dataManager.loadAvatar()
        textField.text = dataManager.loadName()
    }
    
    @objc
    private func didTapImageView() {
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func didTapButton(_ sender: Any) {
        imageView.image = nil
        textField.text = nil
        dataManager.clear()
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        dataManager.save(name: textField.text)
        
        return false
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = image
        dataManager.save(avatar: image)
        picker.dismiss(animated: true, completion: nil)
    }
}
