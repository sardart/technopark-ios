//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 29.10.2021.
//

import Foundation

struct CityViewModel {
    let title: String
    let time: String
    let icon: URL?
    let temp: String
    
    init(with city: CityResponse) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        self.title = city.name
        self.time = dateFormatter.string(from: .init())
        
        let iconString = city.weather.first?.icon ?? ""
        self.icon = URL(string: "https://openweathermap.org/img/wn/\(iconString)@2x.png")
        
        self.temp = "\(Int(city.main.temp))˚C"
    }
}
