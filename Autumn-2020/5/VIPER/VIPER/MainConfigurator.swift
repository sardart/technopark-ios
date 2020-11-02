//
//  MainConfigurator.swift
//  VIPER
//
//  Created by a.reshetnikov on 16.03.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import Foundation

protocol MainConfiguratorProtocol {
    func configureGreetingViewController() -> GreetingViewController
}
class MainConfigurator: MainConfiguratorProtocol {

    func configureGreetingViewController() -> GreetingViewController {
        let view = GreetingViewController()
        let presenter = GreetingPresenter()
        let interactor = GreetingInteractor()
        view.eventHandler = presenter
        presenter.view = view
        presenter.greetingProvider = interactor
        interactor.output = presenter
        return view
    }
}
