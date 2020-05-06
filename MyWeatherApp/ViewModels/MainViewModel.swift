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
    
    //get machine from weather service: Entity
    private var weatherService: WeatherService!
    
    init () {
        self.weatherService = WeatherService()
    }
    
    @Published var weather = Weather()
    
    //value pass to View
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
    
    var tempMin: String {
        if let tempMin = self.weather.temp_min {
            return String(format: "%.0f", tempMin)
        } else {
            return ""
        }
    }
    
    var tempMax: String {
        if let tempMax = self.weather.temp_max {
            return String(format: "%.0f", tempMax)
        } else {
            return ""
        }
        
    }
    
    //value get from View
    var cityName: String = ""
    
    //make suitable machines for View
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





