//
//  WeatherResponse.swift
//  Weather
//
//  Created by Alex on 31.07.22.
//

import Foundation

struct WeatherResponse: Codable {
    var current: WeatherData
    var hourly: [WeatherData]
    var daily: [DailyWeatherData]
    
    func emptyResponse() -> WeatherResponse {
        return WeatherResponse(current: WeatherData(), hourly: [WeatherData](repeating: WeatherData(), count: 23), daily: [DailyWeatherData](repeating: DailyWeatherData(), count: 8))
    }
}
