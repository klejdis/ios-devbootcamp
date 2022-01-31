//
//  WeatherData.swift
//  Clima
//
//  Created by klejdisjorgji on 21.1.22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData : Decodable{
    let name: String
    let weather: [WeatherItem]
    let main: Main
}

struct Main : Decodable{
    let temp: Double
}

struct WeatherItem : Decodable{
    let id: Int
    let description: String
}
