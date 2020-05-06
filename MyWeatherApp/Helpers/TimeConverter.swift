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
    func timeFormatter(input: Double) -> String {
        let unixTime = NSDate(timeIntervalSince1970: input)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return(formatter.string(from: unixTime as Date))
    }
}
