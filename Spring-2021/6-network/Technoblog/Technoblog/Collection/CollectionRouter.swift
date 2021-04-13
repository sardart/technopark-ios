//
//  CollectionRouter.swift
//  Technoblog
//
//  Created by Artur Sardaryan on 4/12/21.
//  
//

import UIKit

final class CollectionRouter {
    private let imagePicker = ImagePicker()
    
    weak var viewController: UIViewController?
}

extension CollectionRouter: CollectionRouterInput {
    func showImagePicker(output: ImagePickerOutput) {
        imagePicker.output = output
        imagePicker.start(in: viewController)
    }
    
    func show(item: CollectionItem) {
        let viewController = UIViewController()
        viewController.title = item.title
        viewController.view.backgroundColor = .systemBackground
        
        self.viewController?.present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
    }
}
