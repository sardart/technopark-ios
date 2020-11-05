//
//  MainConfigurator.swift
//  VIPER
//
//  Created by a.reshetnikov on 16.03.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import Foundation
import UIKit

protocol MainConfiguratorProtocol {
    func configureGreetingViewController() -> UIViewController
}
class MainConfigurator: MainConfiguratorProtocol {

    func configureGreetingViewController() -> UIViewController {
        let view = GreetingViewController()
        let presenter = GreetingPresenter()
        let interactor = NewInteractor()
        view.output = presenter
        presenter.view = view
        presenter.greetingProvider = interactor
        interactor.output = presenter
        return view
    }
}
