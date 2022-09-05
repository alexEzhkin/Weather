//
//  TodayWeatherView.swift
//  Weather
//
//  Created by Alex on 5.08.22.
//

import SwiftUI

struct TodayWeatherView: View {
    @ObservedObject var cityVM: CityViewModel
    
    var body: some View {
        VStack{
            Text(NSLocalizedString("Today", comment: ""))
                .font(.largeTitle)
                .bold()
            
            HStack(spacing: 20) {
                LottieView(name: cityVM.getLottieAnimation(icon: cityVM.weatherIcon))
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text("\(cityVM.temperature)" + NSLocalizedString("Temperature unit", comment: ""))
                        .font(.system(size: 42))
                    Text(cityVM.conditions)
                }
            }
            
            HStack {
                Spacer()
                widgetView(image: "wind", color: .green, title: "\(cityVM.windSpeed)" + NSLocalizedString("Wind speed unit", comment: ""))
                Spacer()
                widgetView(image: "drop.fill", color: .blue, title: "\(cityVM.humidity)")
                Spacer()
                widgetView(image: "umbrella.fill", color: .red, title: "\(cityVM.rainChances)")
                Spacer()
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.white.opacity(0.2), radius: 2, x: 2, y: 2)
        
    }
    
    private func widgetView(image: String, color: Color, title: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            Text(title)
        }
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
