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
    func openCities() {
        let container = CitiesModuleContainer.assemle()
        sourceViewController?.navigationController?.pushViewController(container.viewControler, animated: true)
    }
}
