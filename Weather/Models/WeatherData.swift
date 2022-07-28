//
//  WeatherData.swift
//  Weather
//
//  Created by Alex on 26.07.22.
//

import Foundation

struct WeatherData {
    let currentTemperature: Double
    let humidity: Int
    
    init(networkData: NetworkWeatherData) {
        self.currentTemperature = networkData.current.temperature
        self.humidity = networkData.current.humidity
    }
}
