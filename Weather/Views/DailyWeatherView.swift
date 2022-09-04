//
//  DailyWeatherView.swift
//  Weather
//
//  Created by Alex on 5.08.22.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var cityVM: CityViewModel
    
    var body: some View {
        ForEach(cityVM.weather.daily) { weather in
            LazyVStack {
                dailyCell(weather: weather)
            }
        }
    }
    
    private func dailyCell(weather: DailyWeatherData) -> some View {
        HStack {
            Text(cityVM.getDayFor(timeStamp: weather.date).uppercased())
                .frame(width: 50)
            
            Spacer()
            
            Text("\(cityVM.getTemperature(temp: weather.temperature.max)) | \(cityVM.getTemperature(temp: weather.temperature.min))°C")
                .frame(width: 150)
            
            Spacer()
            
            cityVM.getWeatherIconFor(icon: weather.weatherDetails.count > 0 ? weather.weatherDetails[0].icon : "sun.max.fill")
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 5)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]),
                                 startPoint: .topLeading, endPoint: .bottomTrailing)))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.white.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
