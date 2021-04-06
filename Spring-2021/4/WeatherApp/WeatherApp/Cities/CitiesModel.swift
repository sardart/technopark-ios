//
//  CitiesModel.swift
//  WeatherApp
//
//  Created by Andrey Babkov on 05.04.2021.
//

import Foundation

protocol CitiesModelOutput: AnyObject {
    func didLoad(cities: [CityResponse])
}

final class CitiesModel {
    weak var output: CitiesModelOutput?
    
    func load(cities: [CityServiceInfo]) {
        
        let helper = CitiesServiceHelper(cities: cities)
        let urlString = helper.citiesUrl()
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { [weak self] data, _, error in
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let result = try? decoder.decode(CitiesResponse.self, from: data) else {
                return
            }
            
            
            DispatchQueue.main.async {
                self?.output?.didLoad(cities: result.list)
            }
        })
        
        task.resume()
    }
}
