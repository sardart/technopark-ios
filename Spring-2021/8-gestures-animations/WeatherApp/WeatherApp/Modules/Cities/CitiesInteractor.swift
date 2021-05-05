//
//  CitiesInteractor.swift
//  WeatherApp
//
//  Created by Andrey Babkov on 05.04.2021.
//

import Foundation

final class CitiesInteractor {
    weak var output: CitiesInteractorOutput?
    
    private let citiesManager: CitiesManagerDescription = CitiesManager.shared
}

extension CitiesInteractor: CitiesInteractorInput {
    func loadCity(with name: String) {
        citiesManager.loadCity(with: name) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let city):
                    self?.output?.didLoad(city: city)
                case .failure(let error):
                    self?.output?.didReceive(error: error)
                }
            }
        }
    }
    
    func load(cities: [CityServiceInfo]) {
        citiesManager.load(cities: cities) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let cities):
                    self?.output?.didLoad(cities: cities)
                case .failure(let error):
                    self?.output?.didReceive(error: error)
                }
            }
        }
    }
}
