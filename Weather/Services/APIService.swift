//
//  APIService.swift
//  Weather
//
//  Created by Alex on 28.07.22.
//

import Foundation

struct APIService {
    static let apiKey = "75421f753051fe6586e11b34a16c8cf6"
    static let baseURL = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLFor(latitude: Double, longitude: Double) -> String {
        let languageCode = Locale.current.languageCode
        if languageCode == "ru" {
            return "\(baseURL)onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&appid=\(apiKey)&units=metric"
        } else {
            return "\(baseURL)onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&appid=\(apiKey)&units=imperial"
        }
    }
}
