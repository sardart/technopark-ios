//
//  CitiesPresenter.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 11/16/20.
//  
//

import Foundation

final class CitiesPresenter {
	weak var view: CitiesViewInput?
    weak var moduleOutput: CitiesModuleOutput?

	private let router: CitiesRouterInput
	private let interactor: CitiesInteractorInput

    init(router: CitiesRouterInput, interactor: CitiesInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CitiesPresenter: CitiesModuleInput {
}

extension CitiesPresenter: CitiesViewOutput {
}

extension CitiesPresenter: CitiesInteractorOutput {
}
