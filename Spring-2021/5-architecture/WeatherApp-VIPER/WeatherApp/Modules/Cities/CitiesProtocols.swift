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
}

protocol CitiesInteractorInput: AnyObject {
    func load(cities: [CityServiceInfo])
}

protocol CitiesInteractorOutput: AnyObject {
    func didLoad(cities: [CityResponse])
}

protocol CitiesViewInput: AnyObject {
    func reloadData()
}

protocol CitiesRouterInput {
    func openCities()
}
