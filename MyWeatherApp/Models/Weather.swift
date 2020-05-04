//
//  Weather.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/04.
//  Copyright © 2020 minato. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    var main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
