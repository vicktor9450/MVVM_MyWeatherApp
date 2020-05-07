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
        print("WeatherViewModel:init weatherService Object")
        self.weatherService = WeatherService()
        
    }
    
    @Published var weatherResponse =  WeatherTopLevel()
    

    
    //value pass to View
    
    var weatherDescription: String {
        if let description = self.weatherResponse.weather?.first?.description {
            let formattedDesc = description.capitalized(with: .current)
            print("WeatherViewMode: created weatherDescription")
            return formattedDesc
        }else {
            return ""
        }
    }
    
//    var weatherDescription: String {
//        if let weatherDescription = self.weatherResponse.weather
//    }
    
    var sunRise: String {
        if let sunRise = self.weatherResponse.sys?.sunrise {
            let formattedSunRise = Helper().timeFormatter(input: sunRise)
            return formattedSunRise
        }else {
             return ""
        }
    }
    
    var sunSet: String {
        if let sunSet = self.weatherResponse.sys?.sunset {
            let formattedSunSet = Helper().timeFormatter(input: sunSet)
            return formattedSunSet
            
        }else {
             return ""
        }
    }
    
    var country: String {
        if let country = self.weatherResponse.sys?.country {
            return String(country)
        } else {
            return ""
        }
    }
    
    var windSpeed: String {
        if let windSpeed = self.weatherResponse.wind?.speed {
            return String(windSpeed)
        } else {
            return ""
        }
    }
    
    var location: String {
        if let location = self.weatherResponse.name {
            return String(location)
        } else {
            return ""
        }
    }

    var humidity: String {
        if let humidity = self.weatherResponse.main?.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }
    
    var temperature: String {
        if let temp = self.weatherResponse.main?.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var tempMin: String {
        if let tempMin = self.weatherResponse.main?.temp_min {
            return String(format: "%.0f", tempMin)
        } else {
            return ""
        }
    }
    
    var tempMax: String {
        if let tempMax = self.weatherResponse.main?.temp_max {
            return String(format: "%.0f", tempMax)
        } else {
            return ""
        }
        
    }
    
    //value get from View
    //by default city is FUKUI
    var cityName: String = "Fukui"
    
    //make suitable machines for View
    func fetchWeather() {
        print("WeatherViewModel: init fetchWeather")
        self.weatherService.getWeather(city: self.cityName) {
            weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weatherResponse = weather
                }
            }
        }
    }
}





