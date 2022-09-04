//
//  CityNameView.swift
//  Weather
//
//  Created by Alex on 5.08.22.
//

import SwiftUI

struct CityNameView: View {
    var city: String
    var date: String
    
    var body: some View {
        VStack{
            Text(city)
                .font(.title)
                .bold()
            Text(date)
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
