//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate{
    func didExchangedRate(exchangedItem: ExchangeRateItem)
}


struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "BD66839F-412B-4604-B133-C6B10E4652AA"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    func getUrlForExchange(_ currency: String) -> String{
        return "\(baseURL)/\(currency)?apikey=\(apiKey)"
    }
    
    func getCoinPrice(for currency: String){
        
        if let url = URL(string: getUrlForExchange(currency)){
        
            let session = URLSession(configuration: .default)
            
            let task  = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error)
                    return
                }
                
                if let safeData = data{
                    do {
                        let decoder = JSONDecoder()
                        let decodedItem = try decoder.decode(ExchangeRateItem.self, from: safeData)
                        
                        self.delegate?.didExchangedRate(exchangedItem: decodedItem)
                    }catch{
                        print(error)
                        return
                    }
                }
                
            }
            
            task.resume()
            
        }
        
        
    }
    
}
