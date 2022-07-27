//
//  CoinValue.swift
//  CoinMarket
//
//  Created by Adriancys Jesus Villegas Toro on 26/7/22.
//

import Foundation

struct CoinValue: Codable {
    let USD: UsdValue
}

struct UsdValue: Codable {
    let price: Double
    let marketCap: Double
    let lastUpdated: String
}
