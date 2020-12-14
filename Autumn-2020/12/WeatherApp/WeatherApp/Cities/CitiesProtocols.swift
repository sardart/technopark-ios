//
//  CitiesProtocols.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 11/16/20.
//  
//

import Foundation

protocol CitiesModuleInput {
	var moduleOutput: CitiesModuleOutput? { get }
}

protocol CitiesModuleOutput: class {
}

protocol CitiesViewInput: class {
    func update(at index: Int)
    func insert(at index: Int)
    func remove(at index: Int)
}

protocol CitiesViewOutput: class {
    var itemsCount: Int { get }
    
    func item(at index: Int) -> CityTableViewCellModel
    func didTapAddButton()
    func didSelect(at index: Int)
}

protocol CitiesInteractorInput: class {
    func loadCurrentWeather(for city: String)
}

protocol CitiesInteractorOutput: class {
    func didLoadCurrentWeather(for city: String, currentWeather: CurrentWeather?)
    func didFail(with error: Error, for city: String)
}

protocol CitiesRouterInput: class {
    func showCityInput(completion: @escaping (String?) -> Void)
    func show(_ currentWeather: CurrentWeather)
    func show(_ error: Error)
}
