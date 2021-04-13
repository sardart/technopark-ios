//
//  CollectionContainer.swift
//  Technoblog
//
//  Created by Artur Sardaryan on 4/12/21.
//  
//

import UIKit

final class CollectionContainer {
    let input: CollectionModuleInput
	let viewController: UIViewController
	private(set) weak var router: CollectionRouterInput!

	class func assemble(with context: CollectionContext) -> CollectionContainer {
        let router = CollectionRouter()
        let interactor = CollectionInteractor()
        let presenter = CollectionPresenter(router: router, interactor: interactor)
		let viewController = CollectionViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.viewController = viewController

        return CollectionContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: CollectionModuleInput, router: CollectionRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct CollectionContext {
	weak var moduleOutput: CollectionModuleOutput?
}
