//
//  DailyWeatherData.swift
//  Weather
//
//  Created by Alex on 31.07.22.
//

import Foundation

struct DailyWeatherData: Codable, Identifiable {
    var date: Int
    var temperature: TemperatureData
    var weatherDetails: [WeatherDetail]
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temperature = "temp"
        case weatherDetails = "weather"
    }
    
    init() {
        date = 0
        temperature = TemperatureData(min: 0.0, max: 0.0)
        weatherDetails = [WeatherDetail(main: "", description: "", icon: "")]
    }
}

extension DailyWeatherData {
    var id: UUID {
        return UUID()
    }
}
