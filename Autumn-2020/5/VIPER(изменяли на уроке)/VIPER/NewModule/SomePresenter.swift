//
//  SomePresenter.swift
//  VIPER
//
//  Created by p.nosov on 02.11.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import Foundation
import UIKit

final class SomePresenter {
	weak var view: SomeViewInput?
    weak var moduleOutput: SomeModuleOutput?
    var backgroundColor: UIColor = .white
    var needToPresentNextController: Bool = false

	private let router: SomeRouterInput
	private let interactor: SomeInteractorInput

    init(router: SomeRouterInput, interactor: SomeInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension SomePresenter: SomeModuleInput {
}

extension SomePresenter: SomeViewOutput {
    func readyToDisplayData() {
        view?.updateColor(backgroundColor)
    }

    func didTapButton() {
        router.showNewModule()
        moduleOutput?.didCloseView()
    }
}

extension SomePresenter: SomeInteractorOutput {
}
