//
//  Services.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/04.
//  Copyright © 2020 minato. All rights reserved.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        //verifying URL
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=2b69974a3a50ec3b37511b30332a1463&units=metric&lang=ja") else {
            completion(nil)
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }
    .resume()
    }
}
