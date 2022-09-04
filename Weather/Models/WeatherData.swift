//
//  WeatherData.swift
//  Weather
//
//  Created by Alex on 31.07.22.
//

import Foundation

struct WeatherData: Codable, Identifiable {
    var date: Int
    var temperature: Double
    var feels_like: Double
    var pressure: Int
    var humidity: Int
    var dew_point: Double
    var clouds: Int
    var wind_speed: Double
    var wind_deg: Int
    var weatherDetails: [WeatherDetail]
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temperature = "temp"
        case feels_like
        case pressure
        case humidity
        case dew_point
        case clouds
        case wind_speed
        case wind_deg
        case weatherDetails = "weather"
    }
    
    init() {
        date = 0
        temperature = 0.0
        feels_like = 0.0
        pressure = 0
        humidity = 0
        dew_point = 0.0
        clouds = 0
        wind_speed = 0.0
        wind_deg = 0
        weatherDetails = []
    }
}

extension WeatherData {
    var id: UUID {
        return UUID()
    }
}
