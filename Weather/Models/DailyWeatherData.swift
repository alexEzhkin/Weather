//
//  DailyWeatherData.swift
//  Weather
//
//  Created by Alex on 31.07.22.
//

import Foundation

struct DailyWeatherData: Codable, Identifiable {
    var dt: Int
    var temp: TemperatureData
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = TemperatureData(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}

extension DailyWeatherData {
    var id: UUID {
        return UUID()
    }
}
