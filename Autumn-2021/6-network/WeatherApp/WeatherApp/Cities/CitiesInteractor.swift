//
//  CitiesInteractor.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 29.10.2021.
//  
//

import Foundation

final class CitiesInteractor {
    private let weatherManager: WeatherManagerDescription
    
	weak var output: CitiesInteractorOutput?
    
    init(weatherManager: WeatherManagerDescription = WeatherManager.shared) {
        self.weatherManager = weatherManager
    }
}

extension CitiesInteractor: CitiesInteractorInput {
    func loadCity(name: String) {
        weatherManager.loadCity(name: name) { [weak output] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    output?.didLoad(city: response)
                case .failure(let error):
                    output?.didFail(with: error)
                }
            }
        }
    }
    
    func loadCities() {
        weatherManager.loadCities(with: ["524901", "292223"]) { [weak output] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    output?.didLoad(cities: response.list)
                case .failure(let error):
                    output?.didFail(with: error)
                }
            }
        }
    }
}
