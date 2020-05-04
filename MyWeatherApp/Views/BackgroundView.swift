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
        VStack{
            Image(systemName: "cloud.sun")
            .resizable()
                .aspectRatio(contentMode: .fit
            )
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
