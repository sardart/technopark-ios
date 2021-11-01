//
//  CitiesProtocols.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 29.10.2021.
//  
//

import Foundation

protocol CitiesModuleInput {
	var moduleOutput: CitiesModuleOutput? { get }
}

protocol CitiesModuleOutput: AnyObject {
}

protocol CitiesViewInput: AnyObject {
    func reloadData()
}

protocol CitiesViewOutput: AnyObject {
    var itemsCount: Int { get }
    
    func item(at index: Int) -> CityViewModel
    func didLoadView()
    func didTapAddButton()
    func didPullToRefresh()
}

protocol CitiesInteractorInput: AnyObject {
    func loadCities()
    func loadCity(name: String)
}

protocol CitiesInteractorOutput: AnyObject {
    func didLoad(cities: [CityResponse])
    func didLoad(city: CityResponse)
    func didFail(with error: Error)
}

protocol CitiesRouterInput: AnyObject {
    func showAddCity(onAdd: @escaping (String) -> Void)
    func showError(with text: String)
}
