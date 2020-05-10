//
//  TimeConverter.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/06.
//  Copyright © 2020 minato. All rights reserved.
//

import Foundation
import UIKit
import Network




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
    //Network alert
    func NetworkDetector() {
        //showAlert
        
        //adding which connection you wanna check
        let monitor = NWPathMonitor() //check all
        /*
         let cellMonitor = NWPathMonitor(requiredInterfaceType: .cellular) //cellular
         let wifiMonitor = NWPathMonitor(requiredInterfaceType: .wifi) //check wifi
         let wiredInternet = NWPathMonitor(requiredInterfaceType: .wiredEthernet) // check wire internet (macOS app ONLY)
         */
        
        //create custom DispatchQueue
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)

        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
            } else {
                print("No connection.")
            }
            print("The connection is expensive (cellular/personalHotSpot): \(path.isExpensive)") //_???
        }
        
    }
}





