//
//  City.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 3/22/21.
//

import Foundation

struct City {
    let title: String
    let temperature: Int
    let dateUpdated: Date
    let systemImageName: String
}

struct CityViewModel {
    let title: String
    let temperature: String
    let dateUpdate: String
    let systemImageName: String
}
