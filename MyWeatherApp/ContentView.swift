//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/04.
//  Copyright © 2020 minato. All rights reserved.
//

import SwiftUI
import UIKit


struct ContentView: View {
    
    //get connection to viewModel

    
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(alignment: .leading) {
                Text("Welcome to Weather App")
                    .font(.largeTitle)
                    .padding()
                //pass to viewModel
                WeatherContentView()
                    .padding(20)
                //get from viewModel
                //MidView()
                Text(UIDevice.modelName)
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone XS Max","iPhone XS", "iPhone SE"], id: \.self) { device in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}

