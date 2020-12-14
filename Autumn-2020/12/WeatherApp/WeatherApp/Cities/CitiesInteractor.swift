//
//  CitiesInteractor.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 11/16/20.
//  
//

import Foundation

final class CitiesInteractor {
    private let networkManager: NetworkManagerDescription
    
	weak var output: CitiesInteractorOutput?
    
    init(networkManager: NetworkManagerDescription) {
        self.networkManager = networkManager
    }
}

extension CitiesInteractor: CitiesInteractorInput {
    func loadCurrentWeather(for city: String) {
        networkManager.currentWeather(for: city) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let currentWeather):
                    self?.output?.didLoadCurrentWeather(for: city, currentWeather: currentWeather)
                case .failure(let error):
                    self?.output?.didFail(with: error, for: city)
                }
            }
        }
    }
}
