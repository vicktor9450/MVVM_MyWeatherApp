//
//  TopView.swift
//  MyWeatherApp
//
//  Created by minato on 2020/05/06.
//  Copyright © 2020 minato. All rights reserved.
//

import SwiftUI



struct WeatherContentView: View {
    
    let UIWidth = UIScreen.main.bounds.width
    let UIHeight = UIScreen.main.bounds.height
    
    @State var showField: Bool = false
    @ObservedObject var weatherVM : WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    private func fetch() {
        self.weatherVM.fetchWeather()
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("ここは: \(self.weatherVM.location) in \(self.weatherVM.country)")
                Text("Sun rise at: \(self.weatherVM.sunRise) & Sun set at: \(self.weatherVM.sunSet)")
                Text("Wind Speed: \(self.weatherVM.windSpeed)")
                Text("Temperature is: \(self.weatherVM.temperature)")
                Text("Temperature Min & Max is: \(self.weatherVM.tempMin) & \(self.weatherVM.tempMax)")
                Text("Condition: \(self.weatherVM.weatherDescription)")
                Text("Humidity is: \(self.weatherVM.humidity)")
                
            }
            .onAppear(perform: fetch)
            ZStack(alignment: .leading) {
                TextField("Enter City name", text: self.$weatherVM.cityName) {
                    self.weatherVM.fetchWeather()
                }
                .padding(.all, 10)
                .frame(width: UIWidth - 50, height: 50)
                .background(Color("lightViolet"))
                .cornerRadius(30)
                .foregroundColor(.black)
                .offset(x: self.showField ? 0 : (-UIWidth / 2 - 180))
                .animation(.spring())
                
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .offset(x: self.showField ? (UIWidth - 90) : -30)
                    .animation(.spring())
                    .onTapGesture {
                        self.showField.toggle()
                }
                

                
            }
            
        }
        
    }
}


#if DEBUG
struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherContentView()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            WeatherContentView()
                .environment(\.colorScheme, .dark)
            NavigationView {
                WeatherContentView()
            }
        }
    }
}
#endif
