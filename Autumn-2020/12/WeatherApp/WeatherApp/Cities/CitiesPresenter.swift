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
    
    private var cities: [String] = ["Moscow", "London", "Bangkok"]
    
    private var weatherByName: [String: CurrentWeather] = [:]

    init(router: CitiesRouterInput, interactor: CitiesInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CitiesPresenter: CitiesModuleInput {
}

extension CitiesPresenter: CitiesViewOutput {
    var itemsCount: Int {
        return cities.count
    }
    
    func item(at index: Int) -> CityTableViewCellModel {
        let city = cities[index]
        if let currentWeather = weatherByName[city] {
            return CityTableViewCellModel(imageURL: currentWeather.imageURL,
                                          title: currentWeather.name,
                                          timeString: currentWeather.timeString,
                                          temperature: Int(currentWeather.main.temp - 273.15))
        } else {
            interactor.loadCurrentWeather(for: city)
        }
        
        return CityTableViewCellModel(imageURL: nil, title: cities[index], timeString: nil, temperature: nil)
    }
    
    func didTapAddButton() {
        router.showCityInput() { [weak self] city in
            guard let self = self, let city = city else {
                return
            }
            
            self.cities.append(city)
            if let index = self.cities.firstIndex(of: city) {
                self.view?.insert(at: index)
            }
        }
    }
    
    func didSelect(at index: Int) {
        let city = cities[index]
        guard let currentWeather = weatherByName[city] else {
            return
        }
        
        router.show(currentWeather)
    }
}

extension CitiesPresenter: CitiesInteractorOutput {
    func didLoadCurrentWeather(for city: String, currentWeather: CurrentWeather?) {
        weatherByName[city] = currentWeather
        if let index = cities.firstIndex(of: city) {
            view?.update(at: index)
        }
    }
    
    func didFail(with error: Error, for city: String) {
        router.show(error)

        // или можно не удалять руками
        if let index = cities.firstIndex(of: city) {
            cities.remove(at: index)
            view?.remove(at: index)
        }
    }
}
