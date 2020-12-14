//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 11/16/20.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
    case emptyData
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "invalid url!!"
        case .emptyData:
            return "no data!!"
        }
    }
}

protocol NetworkManagerDescription: AnyObject {
    func currentWeather(for city: String, completion: @escaping (Result<CurrentWeather, Error>) -> Void)
}

final class NetworkManager: NetworkManagerDescription {
    static let shared: NetworkManagerDescription = NetworkManager()
    
    private let apiKey = "149626f11b28cc7c490cbfbebec29fab"
    
    private init() {}
    
    func currentWeather(for city: String, completion: @escaping (Result<CurrentWeather, Error>) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APIKEY=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, !data.isEmpty else {
                completion(.failure(NetworkError.emptyData))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let currentWeather = try decoder.decode(CurrentWeather.self, from: data)
                completion(.success(currentWeather))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
