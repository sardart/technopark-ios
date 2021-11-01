//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 29.10.2021.
//

import Foundation


enum NetworkError: Error {
    case unexpected
}

protocol WeatherManagerDescription {
    func loadCity(name: String, completion: @escaping (Result<CityResponse, Error>) -> Void)
    func loadCities(with ids: [String], completion: @escaping (Result<CitiesResponse, Error>) -> Void)
}

final class WeatherManager: WeatherManagerDescription {
    
    static let shared: WeatherManagerDescription = WeatherManager()
    static let appId = "a38a69833f4040853b4ef08063f5986d"
    
    private init() {}
    
    func loadCity(name: String, completion: @escaping (Result<CityResponse, Error>) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(name)&units=metric&appid=\(Self.appId)") else {
            completion(.failure(NetworkError.unexpected))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.unexpected))
                return
            }
            
            print(try? JSONSerialization.jsonObject(with: data, options: []))
            
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
    
    func loadCities(with ids: [String], completion: @escaping (Result<CitiesResponse, Error>) -> Void) {
        guard let url = url(for: ids) else {
            completion(.failure(NetworkError.unexpected))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.unexpected))
                return
            }
            
            print(try? JSONSerialization.jsonObject(with: data, options: []))
            
            let decoder = JSONDecoder()
            
            do {
                let result = try decoder.decode(CitiesResponse.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    private func url(for ids: [String]) -> URL? {
        var ids = ids.reduce("",  { res, current in
            return res + current + ","
        })
        
        if ids.last == "," {
            _ = ids.popLast()
        }
        
        let urlString = "https://api.openweathermap.org/data/2.5/group?id=\(ids)&units=metric&appid=\(Self.appId)"
        
        return URL(string: urlString)
    }
}
