//
//  Services.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/04.
//  Copyright © 2020 minato. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherViewControl: CLLocationManager {
    let locationManager = CLLocationManager()
    
    //Setup location manager
    
}




class WeatherService {
    func getWeather(city: String, completion: @escaping (WeatherTopLevel?) -> ()) {
        /* Explain why cityName need to be Prepaing
         //Preparing city compatible with requesting API
         
         //Modify string city: in to allowed character
         //Explain: If request with city name "Ho chi minh" the space in string will crash the request, need to add "%20" in the space in city to be "Ho%20chi%20minh"
         //Improved with @propertyWrapper
         //Or using this method
         //        func searchCity() {
         //            if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
         //                fetchWeatherForecast(by: city)
         //            }
         //        }
         
         //verifying URL
         */
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(preparingCity(city: city))&appid=2b69974a3a50ec3b37511b30332a1463&units=metric&lang=ja") else {
            completion(nil)
            
            return
        }
        print(url)
        
        //make URLSession waiting for internet connection
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.timeoutIntervalForResource = 60
        
        URLSession(configuration: config).dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("\(String(describing: error)) at data")
                completion(nil)
                return
            }
            
            let weather = try? JSONDecoder().decode(WeatherTopLevel.self, from: data)
            if let weather = weather {
                completion(weather)
            
                print(weather)
            } else {
                completion(nil)
                print("\(String(describing: error)) at JSON decode")
                
            }
        }
        .resume()
    }
}
//MARK:- propertyWrapper UrlEncode
@propertyWrapper
class UrlEncode {
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get {value}
        set {
            if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                self.value = url
            }
        }
    }
}

struct Resource {
    @UrlEncode
    var city: String // Los Angleos
    var url: String {
        "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=2b69974a3a50ec3b37511b30332a1463&units=metric&lang=ja"
    }
}

//Fix the bug in Xcode show wrong type of city -> Resource(city: UrlEncode) <-
extension Resource {
    init(city: String) {
        self.city = city
    }
}

func preparingCity(city: String) -> String {
    let cityPrepared = Resource(city: city)
    return cityPrepared.city
}

