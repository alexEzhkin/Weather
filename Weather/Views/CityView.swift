//
//  CityView.swift
//  Weather
//
//  Created by Alex on 5.08.22.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        VStack {
            CityNameView(city: cityViewModel.city, date: cityViewModel.date)
                .shadow(radius: 0)
            if cityViewModel.loading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(2)
            }
            TodayWeatherView(cityVM: cityViewModel)
                .padding()
            HourlyWeatherView(cityVM: cityViewModel)
            DailyWeatherView(cityVM: cityViewModel)
        }.padding(.bottom, 30)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
