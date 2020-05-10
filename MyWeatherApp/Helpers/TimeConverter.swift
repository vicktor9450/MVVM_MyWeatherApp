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
    // Formatting the UNIX time type from API request
    func timeFormatter(input: Double) -> String {
        let unixTime = NSDate(timeIntervalSince1970: input)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return(formatter.string(from: unixTime as Date))
    }
    
    // omw for logging
    func logPosition() {
        let position = "the position when itself declared"
        print(position)
    }
    
    // Showing weather Icon
    func showDecodedCountry(item: WeatherTopLevel) -> String {
        let encodedIcon = item.sys?.country
        switch encodedIcon {
        case "JP":
            return "Japan"
        default:
            return ""
        }
    }

}
