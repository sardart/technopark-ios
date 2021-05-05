//
//  CityServiceModel.swift
//  WeatherApp
//
//  Created by Andrey Babkov on 05.04.2021.
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
}

struct CityMainInfo: Decodable {
    let temp: Float
    let feelsLike: Float
    
    enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case temp
    }
}

struct CitySysInfo: Decodable {
    let timezone: Int?
}

