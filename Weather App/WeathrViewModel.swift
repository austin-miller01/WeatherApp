//
//  WeathrViewModel.swift
//  Weather App
//
//  Created by austin miller on 8/9/21.
//

import Foundation
private let defaultIcon = "?"
private let iconMap = [
    "Drizzle" : "🌦",
    "Thunderstorm": "⛈",
    "Rain": "🌧",
    "Snow": "❄️",
    "Clear": "☀️",
    "Clouds": "☁️",
]

public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService : WeatherService
    
    public init(weatherService : WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh(){
        weatherService.loadWeatherData{
            weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)℉"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
