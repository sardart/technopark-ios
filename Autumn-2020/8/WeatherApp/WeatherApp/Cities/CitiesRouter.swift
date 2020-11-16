//
//  CitiesRouter.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 11/16/20.
//  
//

import UIKit

final class CitiesRouter {
    weak var viewController: UIViewController?
}

extension CitiesRouter: CitiesRouterInput {
    func showCityInput(completion: @escaping (String?) -> Void) {
        let alertController = UIAlertController(title: "New city", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            completion(alertController.textFields?.first?.text)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        alertController.addTextField(configurationHandler: nil)
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    func show(_ currentWeather: CurrentWeather) {
        let cityViewController = CityViewController()
        cityViewController.title = currentWeather.name
        viewController?.navigationController?.pushViewController(cityViewController, animated: true)
    }
    
    func show(_ error: Error) {
        let message: String = (error as? NetworkError)?.errorDescription ?? error.localizedDescription
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
