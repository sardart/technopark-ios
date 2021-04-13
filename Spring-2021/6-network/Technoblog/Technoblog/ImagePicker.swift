//
//  ImagePicker.swift
//  Technoblog
//
//  Created by Artur Sardaryan on 4/12/21.
//

import UIKit

protocol ImagePickerOutput: AnyObject {
    func didSelect(image: UIImage?)
}

final class ImagePicker: NSObject {
    weak var output: ImagePickerOutput?
    
    func start(in viewController: UIViewController?) {
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        viewController?.present(imagePickerController, animated: true, completion: nil)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
        output?.didSelect(image: image)
    }
}

extension ImagePicker: UINavigationControllerDelegate {
    
}
