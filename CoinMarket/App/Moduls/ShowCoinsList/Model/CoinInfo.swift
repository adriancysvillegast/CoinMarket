//
//  CoinInfo.swift
//  CoinMarket
//
//  Created by Adriancys Jesus Villegas Toro on 26/7/22.
//

import Foundation

struct CoinInfo: Codable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let numMarketPairs: Int
    let dateAdded: String
    let lastUpdated: String
    let quote: CoinValue
}
