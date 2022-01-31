//
//  WeatherManager.swift
//  Clima
//
//  Created by klejdisjorgji on 21.1.22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate{
    func didUpdateWeather(weather: WeatherModel)
}


struct WeatherManager{
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=0f73234171ccb4d873b5ed8b31c24840&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchUrl(city: String){
        let urlString = "\(weatherUrl)&q=\(city)"
        
        performRequest(urlString: urlString)
    }
    
    func fetchByCoordinate(lat: Double, lng: Double){
        let urlString = "\(weatherUrl)&lat=\(lat)&lon=\(lng)"
        print(urlString)
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                
                let decoder = JSONDecoder()
                
                do{
                    let decodedData = try decoder.decode(WeatherData.self, from: data!)
                    let weather = WeatherModel(id: decodedData.weather[0].id, name: decodedData.name, temp: decodedData.main.temp)
                    
                    delegate?.didUpdateWeather(weather: weather)
                }
                catch{
                    print(error)
                }
                
                
            }
            
            task.resume()
        }
    }
    

}
