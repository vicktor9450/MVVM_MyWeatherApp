//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/04.
//  Copyright © 2020 minato. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM : WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()

    }
    
    var body: some View {
        VStack {
            Text("Welcome to Weather App")
        TextField("Enter City", text: self.$weatherVM.cityName) {
            self.weatherVM.search()
        }
        .padding()
            Text("Temperatureis: \(self.weatherVM.temperature)")
            Text("Humidity is: \(self.weatherVM.humidity)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
