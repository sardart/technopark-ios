//
//  CitiesManager.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 4/12/21.
//

import Foundation

enum NetworkError: Error {
    case unexpected
}

protocol CitiesManagerDescription: AnyObject {
    func loadCity(with name: String, completion: @escaping (Result<CityResponse, Error>) -> Void)
    func load(cities: [CityServiceInfo], completion: @escaping (Result<[CityResponse], Error>) -> Void)
}

final class CitiesManager: CitiesManagerDescription {
    static let appId = "a38a69833f4040853b4ef08063f5986d"

    static let shared: CitiesManagerDescription = CitiesManager()
    
    private init() {}
    
    func loadCity(with name: String, completion: @escaping (Result<CityResponse, Error>) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(name)&units=metric&APIKEY=\(CitiesManager.appId)") else {
            completion(.failure(NetworkError.unexpected))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.unexpected))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let result = try decoder.decode(CityResponse.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func load(cities: [CityServiceInfo], completion: @escaping (Result<[CityResponse], Error>) -> Void) {
        let helper = CitiesServiceHelper(cities: cities)
        let urlString = helper.citiesUrl()
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.unexpected))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.unexpected))
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let result = try? decoder.decode(CitiesResponse.self, from: data) else {
                completion(.failure(NetworkError.unexpected))
                return
            }
            
            completion(.success(result.list))
        }
        
        task.resume()
    }
}
