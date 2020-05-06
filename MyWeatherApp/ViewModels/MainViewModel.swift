//
//  MainViewModel.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/04.
//  Copyright © 2020 minato. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherService!
    
    init () {
        self.weatherService = WeatherService()
    }
    
    @Published var weather = Weather()
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""

    func fetchWeather() {
        self.weatherService.getWeather(city: self.cityName) {
            weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
}





