//
//  APIService.swift
//  Weather
//
//  Created by Alex on 28.07.22.
//

import Foundation

struct APIService {
    let apiKey = "75421f753051fe6586e11b34a16c8cf6"
    let baseURL = "https://api.openweathermap.org/data/3.0/"
    
    func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURL)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(apiKey)&units=metric"
    }
}
