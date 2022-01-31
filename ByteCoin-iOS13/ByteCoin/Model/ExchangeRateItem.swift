//
//  ExchangeRateItem.swift
//  ByteCoin
//
//  Created by klejdisjorgji on 28.1.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct ExchangeRateItem : Decodable{
    let asset_id_base: String
    let asset_id_quote: String
    
    let rate: Double
    
    var stringRate:  String{
        return String(format: "%.2f", rate)
    }
    
}
