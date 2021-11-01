//
//  CitiesPresenter.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 29.10.2021.
//  
//

import Foundation

final class CitiesPresenter {
	weak var view: CitiesViewInput?
    weak var moduleOutput: CitiesModuleOutput?

	private let router: CitiesRouterInput
	private let interactor: CitiesInteractorInput
    
    private var viewModels: [CityViewModel] = []

    init(router: CitiesRouterInput, interactor: CitiesInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CitiesPresenter: CitiesModuleInput {
}

extension CitiesPresenter: CitiesViewOutput {
    func didTapAddButton() {
        router.showAddCity() { [weak self] text in
            self?.interactor.loadCity(name: text)
        }
    }
    
    func didPullToRefresh() {
        interactor.loadCities()
    }
    
    var itemsCount: Int {
        return viewModels.count
    }
    
    func item(at index: Int) -> CityViewModel {
        return viewModels[index]
    }
    
    func didLoadView() {
        interactor.loadCities()
    }
}

extension CitiesPresenter: CitiesInteractorOutput {
    func didLoad(city: CityResponse) {
        viewModels.append(CityViewModel(with: city))
        view?.reloadData()
    }
    
    func didLoad(cities: [CityResponse]) {        
        viewModels = cities.map { CityViewModel(with: $0) }
        view?.reloadData()
    }
    
    func didFail(with error: Error) {
        router.showError(with: error.localizedDescription)
    }
}
