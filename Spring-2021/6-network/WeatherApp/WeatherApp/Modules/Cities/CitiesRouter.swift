//
//  CitiesRouter.swift
//  WeatherApp
//
//  Created by Andrey Babkov on 05.04.2021.
//

import UIKit

final class CitiesRouter {
    weak var sourceViewController: UIViewController?
}

extension CitiesRouter: CitiesRouterInput {
    func showCity(model: CityViewModel) {
        let viewController = UIViewController()
        viewController.title = model.title
        viewController.view.backgroundColor = .systemBackground
        
        let navigationController = UINavigationController(rootViewController: viewController)
        sourceViewController?.present(navigationController, animated: true, completion: nil)
    }
}
