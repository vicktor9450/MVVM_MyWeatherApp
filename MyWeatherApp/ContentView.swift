//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/04.
//  Copyright © 2020 minato. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //get connection to viewModel
    @ObservedObject var weatherVM : WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(alignment: .leading) {
                Text("Welcome to Weather App")
                    .font(.largeTitle)
                    .padding()
                //pass to viewModel
                TextField("Enter City", text: self.$weatherVM.cityName) {
                    self.weatherVM.fetchWeather()
                }
                .padding(20)
                //get from viewModel
                VStack(alignment: .leading) {
                    Text("Temperature is: \(self.weatherVM.temperature)")
                        Text("Temperature Min & Max is: \(self.weatherVM.tempMin) & \(self.weatherVM.tempMax)")
                    Text("Humidity is: \(self.weatherVM.humidity)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone XS Max","iPhone XS", "iPhone SE"], id: \.self) { device in
        ContentView()
            .previewDevice(PreviewDevice(rawValue: device))
            .previewDisplayName(device)
        }
    }
}

