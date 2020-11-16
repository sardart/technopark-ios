//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 11/16/20.
//

import Foundation

struct CurrentWeather: Codable {
    struct Main: Codable {
        let temp: Double
        let pressure: Int
        let humidity: Int
    }
    
    struct Weather: Codable {
        let icon: String
    }
    
    let main: Main
    let weather: [Weather]
    let name: String
    let dt: Double
    
    var imageURL: URL? {
        URL(string: "https://openweathermap.org/img/wn/\(weather.first?.icon ?? "")@2x.png")
    }
    
    var timeString: String {
        let dateFormetter = DateFormatter()
        dateFormetter.timeStyle = .short
        dateFormetter.dateStyle = .none
        
        let date = Date(timeIntervalSince1970: dt)
        
        return dateFormetter.string(from: date)
    }
}
