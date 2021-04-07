//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

final class ___VARIABLE_ModuleName___Container {
    let input: ___VARIABLE_ModuleName___ModuleInput
	let viewController: UIViewController
	private(set) weak var router: ___VARIABLE_ModuleName___RouterInput!

	class func assemble(with context: ___VARIABLE_ModuleName___Context) -> ___VARIABLE_ModuleName___Container {
        let router = ___VARIABLE_ModuleName___Router()
        let interactor = ___VARIABLE_ModuleName___Interactor()
        let presenter = ___VARIABLE_ModuleName___Presenter(router: router, interactor: interactor)
		let viewController = ___VARIABLE_ModuleName___ViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return ___VARIABLE_ModuleName___Container(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ___VARIABLE_ModuleName___ModuleInput, router: ___VARIABLE_ModuleName___RouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ___VARIABLE_ModuleName___Context {
	weak var moduleOutput: ___VARIABLE_ModuleName___ModuleOutput?
}
