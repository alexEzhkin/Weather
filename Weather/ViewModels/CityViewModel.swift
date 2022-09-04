//
//  CityViewModel.swift
//  Weather
//
//  Created by Alex on 31.07.22.
//

import Foundation
import SwiftUI
import CoreLocation

class CityViewModel: ObservableObject {
    
    @Published var weather = WeatherResponse.emptyResponse()
    @Published var city: String = "Minsk" {
        didSet {
            getLocation()
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init() {
        getLocation()
    }
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.date)))
    }
    
    var weatherIcon: String {
        if weather.current.weatherDetails.count > 0 {
            return weather.current.weatherDetails[0].icon
        }
        return weather.current.weatherDetails.first?.icon ?? "sun.max.fill"
    }
    
    func getTemperature(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    var temperature: String {
        return getTemperature(temp: weather.current.temperature)
    }
    
    var conditions: String {
        if weather.current.weatherDetails.count > 0 {
            return weather.current.weatherDetails[0].main
        }
        return weather.current.weatherDetails.first?.main ?? ""
    }
    
    var windSpeed: String {
        return String(format: "%0.1f", weather.current.wind_speed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChances: String {
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    
    func getTimeFor(timeStamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    func getDayFor(timeStamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    func getWeather(coordinate: CLLocationCoordinate2D?) {
        if let coordinate = coordinate {
            let urlString = APIService.getURLFor(latitude: coordinate.latitude, longitude: coordinate.longitude)
            getWeatherInternal(city: city, for: urlString)
        } else {
            let urlString = APIService.getURLFor(latitude: 53.9000, longitude: 27.5666)
            getWeatherInternal(city: city, for: urlString)
        }
    }
    
    func getWeatherInternal(city: String, for urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        NetworkManager<WeatherResponse>.fetch(for: url) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coordinate: place.location?.coordinate)
            }
        }
    }
    
    func getLottieAnimation(icon: String) -> String {
        switch icon {
        case "01d":
            return "dayClearSky"
        case "01n":
            return "nightClearSky"
        case "02d":
            return "dayFewClouds"
        case "02n":
            return "nightFewClouds"
        case "03d":
            return "dayScatteredClouds"
        case "03n":
            return "nightScatteredClouds"
        case "04d":
            return "dayBrokenClouds"
        case "04n":
            return "nightBrokenClouds"
        case "09d":
            return "dayShowerRains"
        case "09n":
            return "nightShowerRains"
        case "10d":
            return "dayRain"
        case "10n":
            return "nightRain"
        case "11d":
            return "dayThunderstorm"
        case "11n":
            return "nightThunderstorm"
        case "13d":
            return "daySnow"
        case "13n":
            return "nightSnow"
        case "50d":
            return "dayMist"
        case "50n":
            return "nightMist"
        default:
            return "dayClearSky"
        }
    }
    
    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill")
        case "01n":
            return Image(systemName: "moon.fill")
        case "02d":
            return Image(systemName: "cloud.sun.fill")
        case "02n":
            return Image(systemName: "cloud.moon.fill")
        case "03d":
            return Image(systemName: "cloud.fill")
        case "03n":
            return Image(systemName: "cloud.fill")
        case "04d":
            return Image(systemName: "cloud.fill")
        case "04n":
            return Image(systemName: "cloud.fill")
        case "09d":
            return Image(systemName: "cloud.drizzle.fill")
        case "09n":
            return Image(systemName: "cloud.drizzle.fill")
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill")
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill")
        case "11d":
            return Image(systemName: "cloud.bolt.fill")
        case "11n":
            return Image(systemName: "cloud.bolt.fill")
        case "13d":
            return Image(systemName: "cloud.snow.fill")
        case "13n":
            return Image(systemName: "cloud.snow.fill")
        case "50d":
            return Image(systemName: "cloud.fog.fill")
        case "50n":
            return Image(systemName: "cloud.snow.fill")
        default:
            return Image(systemName: "sun.max.fill")
        }
    }
}
