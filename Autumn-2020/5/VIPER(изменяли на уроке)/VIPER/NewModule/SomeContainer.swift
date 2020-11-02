//
//  SomeContainer.swift
//  VIPER
//
//  Created by p.nosov on 02.11.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import UIKit

final class SomeContainer {
    let input: SomeModuleInput
	let viewController: UIViewController
	private(set) weak var router: SomeRouterInput!

	class func assemble(with context: SomeContext) -> SomeContainer {
        let router = SomeRouter()
        let interactor = SomeInteractor()
        let presenter = SomePresenter(router: router, interactor: interactor)
		let viewController = SomeViewController(output: presenter)
        presenter.needToPresentNextController = context.needToPresentNextController

        router.rootViewController = viewController

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        presenter.backgroundColor = context.backgroundColor

		interactor.output = presenter

        return SomeContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: SomeModuleInput, router: SomeRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct SomeContext {
    let backgroundColor: UIColor
    var needToPresentNextController: Bool = false
	weak var moduleOutput: SomeModuleOutput?
}
