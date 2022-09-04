//
//  ContentView.swift
//  Weather
//
//  Created by Alex on 26.07.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityViewModel = CityViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                MenuHeaderView(cityViewModel: cityViewModel)
                ScrollView(showsIndicators: false) {
                    CityView(cityViewModel: cityViewModel)
                }
            }
            .padding(.top, 50)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
