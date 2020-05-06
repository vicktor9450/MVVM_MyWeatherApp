//
//  Weather.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/04.
//  Copyright © 2020 minato. All rights reserved.
//

import Foundation

struct WeatherTopLevel: Decodable {
    var main: WeatherMain?
    var coord: Coordination?
    var weather: [WeatherDescription]?
    var wind: Wind?
    var name: String? //福井
    var sys: SystemInfo?
    
}

struct WeatherMain: Decodable {
    var temp: Double?
    var humidity: Double?
    var temp_min: Double?
    var temp_max: Double?
}

struct Coordination: Decodable {
    let lon: Double?
    let lat: Double?
}

struct WeatherDescription: Decodable {
    let main: String? //Rain
    let description: String? //小雨
    let icon: String?
}

struct Wind: Decodable {
    var speed: Double?
    var deg: Double?
}

struct SystemInfo: Decodable {
    var country: String? //JP
    var sunrise: Double?
    var sunset: Double?
}
