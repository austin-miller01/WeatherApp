//
//  Weather_AppApp.swift
//  Weather App
//
//  Created by austin miller on 8/8/21.
//

import SwiftUI

@main
struct Weather_AppApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}
