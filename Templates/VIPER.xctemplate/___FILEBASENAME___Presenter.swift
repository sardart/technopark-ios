//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

final class ___VARIABLE_ModuleName___Presenter {
	weak var view: ___VARIABLE_ModuleName___ViewInput?
    weak var moduleOutput: ___VARIABLE_ModuleName___ModuleOutput?

	private let router: ___VARIABLE_ModuleName___RouterInput
	private let interactor: ___VARIABLE_ModuleName___InteractorInput

    init(router: ___VARIABLE_ModuleName___RouterInput, interactor: ___VARIABLE_ModuleName___InteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ___VARIABLE_ModuleName___Presenter: ___VARIABLE_ModuleName___ModuleInput {
}

extension ___VARIABLE_ModuleName___Presenter: ___VARIABLE_ModuleName___ViewOutput {
}

extension ___VARIABLE_ModuleName___Presenter: ___VARIABLE_ModuleName___InteractorOutput {
}
