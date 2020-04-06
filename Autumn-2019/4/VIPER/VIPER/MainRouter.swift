//
//  MainRouter.swift
//  VIPER
//
//  Created by a.reshetnikov on 16.03.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import Foundation

protocol MainRouterProtocol {
    func presentGreetingViewController()
}

class MainRouter: MainRouterProtocol {
    weak var viewController: ViewController!
    lazy var mainConfigurator = MainConfigurator()
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func presentGreetingViewController() {
        let view = mainConfigurator.configureGreetingViewController()
        viewController.present(view, animated: true, completion: nil)
    }

}
