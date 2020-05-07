//
//  TimeConverter.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/06.
//  Copyright © 2020 minato. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    //formatter for requested UNIX time
    func timeFormatter(input: Double) -> String {
        let unixTime = NSDate(timeIntervalSince1970: input)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return(formatter.string(from: unixTime as Date))
    }
    
    // for logging
    func logPosition() {
        let position = "the position when itself declared"
        print(position)
    }
    
    //show weather status icon
    func showWeatherIcon(item: WeatherDescription) -> String {
    //let main = item.list?.first?.weather![0].main
    let main = item.main

    //let main = (item.list?.first?.weather?.first?.main)!

           switch main {
           case "Ash":
               return "cloud.hail"
           case "Clear":
               return "sun.max"
           case "Clouds":
               return "cloud.sun.fill"
           case "Drizzle":
               return "cloud.drizzle.fill"
           case "Dust":
               return "sun.dust.fill"
           case "Fog":
               return "cloud.fog.fill"
           case "Haze":
               return "sun.haze.fill"
           case "Mist":
               return "cloud.drizzle"
           case "Rain":
               return "cloud.rain.fill"
           case "Sand":
               return "cloud.hail"
           case "Snow":
               return "cloud.snow.fill"
           case "Squall":
               return "cloud.hail"
           case "Thunderstorm":
               return "cloud.bol.fill"

           default:
               return "clear"
           }

       }

}
