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
    weak var rootViewController: ViewController!
    lazy var mainConfigurator = MainConfigurator()
    
    init(viewController: ViewController) {
        self.rootViewController = viewController
    }
    
    func presentGreetingViewController() {

        let context = SomeContext(backgroundColor: .green, needToPresentNextController: true, moduleOutput: self)
        let container = SomeContainer.assemble(with: context)

//        let view = mainConfigurator.configureGreetingViewController()
//        rootViewController.present(view, animated: true, completion: nil)

        rootViewController.present(container.viewController, animated: true, completion: nil)

    }

}

extension MainRouter: SomeModuleOutput {
    func didCloseView() {
        debugPrint(#function)
    }
}
