//
//  CitiesProtocols.swift
//  WeatherApp
//
//  Created by Andrey Babkov on 05.04.2021.
//

import Foundation

protocol CitiesViewOutput: AnyObject {
    var citiesViewModels: [CityViewModel] { get }
    
    func didLoadView()
    func didPullRefesh()
    func didTapAddButton()
    func didSelectItem(at index: Int)
}

protocol CitiesInteractorInput: AnyObject {
    func load(cities: [CityServiceInfo])
    func loadCity(with name: String)
}

protocol CitiesInteractorOutput: AnyObject {
    func didLoad(cities: [CityResponse])
    func didLoad(city: CityResponse)
    func didReceive(error: Error)
}

protocol CitiesViewInput: AnyObject {
    func reloadData()
}

protocol CitiesRouterInput {
    func showCity(model: CityViewModel)
}
