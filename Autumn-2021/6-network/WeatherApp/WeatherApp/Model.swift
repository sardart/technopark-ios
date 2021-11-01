//
//  Model.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 29.10.2021.
//

import Foundation

struct CitiesResponse: Decodable {
    let list: [CityResponse]
}

struct CityResponse: Decodable {
    let name: String
    let id: Int
    let main: CityMainInfo
    let sys: CitySysInfo
    let weather: [CityWeather]
}

struct CityWeather: Decodable {
    let icon: String
}

struct CityMainInfo: Decodable {
    let temp: Float
    let feelsLike: Float
    
    enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case temp
    }
}

struct CitySysInfo: Codable {
    let timezone: Int?
}
