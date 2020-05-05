//
//  BackgroundView.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/04.
//  Copyright © 2020 minato. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("lightViolet"), Color("lightOrange")]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
//            Image(systemName: "cloud.sun")
//                .resizable()
//                .aspectRatio(contentMode: .fit
//            )
        }
    }
}

//support multiple environments (devices)
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { device in
                
                BackgroundView().previewDevice(PreviewDevice(rawValue: device))
                    .previewDisplayName(device)
            }
        }
    }
}
