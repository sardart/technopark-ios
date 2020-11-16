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
}

protocol CitiesViewOutput: class {
}

protocol CitiesInteractorInput: class {
}

protocol CitiesInteractorOutput: class {
}

protocol CitiesRouterInput: class {
}
