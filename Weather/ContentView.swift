//
//  ContentView.swift
//  Weather
//
//  Created by Alex on 26.07.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                MenuHeaderView(cityViewModel: cityVM)
                ScrollView(showsIndicators: false) {
                    CityView(cityVM: cityVM)
                }
            }.padding(.top, 30)
        }.background(LinearGradient(gradient: Gradient(colors: []), startPoint: .topLeading, endPoint: .bottomTrailing))
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
