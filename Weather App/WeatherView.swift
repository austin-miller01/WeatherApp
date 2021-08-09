//
//  ContentView.swift
//  Weather App
//
//  Created by austin miller on 8/8/21.
//

import SwiftUI
extension Color{
    static let BackgroundGray = Color("BackGroundGrey")
    static let BackgroundBlue = Color("BackgroundBlue")
}
struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack{
            if(viewModel.weatherIcon == "☀️" ){
                Color.BackgroundBlue.edgesIgnoringSafeArea(.all)
                
            }
            else {Color.BackgroundGray.edgesIgnoringSafeArea(.all)}
            VStack{
                Text(viewModel.weatherIcon)
                    .font(.system(size: 80))
                    .padding()
                Text(viewModel.cityName)
                    .font(.largeTitle)
                    .padding()
                Text(viewModel.temperature)
                    .font(.system(size: 70))
                    .bold()
                Text(viewModel.weatherDescription)
            }.onAppear(perform: viewModel.refresh)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
            
    }
}
