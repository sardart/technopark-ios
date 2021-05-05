//
//  CitiesModuleContainer.swift
//  WeatherApp
//
//  Created by Andrey Babkov on 05.04.2021.
//

import UIKit

final class CitiesModuleContainer {
    let viewControler: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewControler = viewController
    }
    
    class func assemle() -> CitiesModuleContainer {
        let interactor = CitiesInteractor()
        let router = CitiesRouter()
        let presenter = CitiesPresenter(interactor: interactor, router: router)
        
        let viewController = CitiesViewController(output: presenter)
        
        router.sourceViewController = viewController
        interactor.output = presenter
        presenter.view = viewController
        
        return CitiesModuleContainer(viewController: viewController)
    }
}
