//
//  CitiesRouter.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 29.10.2021.
//  
//

import UIKit

final class CitiesRouter {
    weak var viewController: UIViewController?
}

extension CitiesRouter: CitiesRouterInput {
    func showAddCity(onAdd: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: "Add City", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            
        }
        
        alertController.addAction(.init(title: "OK", style: .default, handler: { _ in
            guard let text = alertController.textFields?.first?.text else {
                return
            }
            
            onAdd(text)
        }))
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showError(with text: String) {
        let alertController = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        
        alertController.addAction(.init(title: "OK", style: .default, handler: nil))
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
