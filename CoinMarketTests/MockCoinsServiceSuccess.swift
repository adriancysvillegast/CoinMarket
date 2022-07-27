//
//  MockCoinsServiceSuccess.swift
//  CoinMarketTests
//
//  Created by Adriancys Jesus Villegas Toro on 27/7/22.
//

import Foundation
@testable import CoinMarket

class MockCoinsServiceSuccess: CoinsServiceFetching {
    func getCoinsList(onComplete: @escaping ([CoinInfo]) -> (), onError: @escaping (String) -> ()) {
        let url = Bundle.main.url(forResource: "CoinsMock", withExtension: "json")
//        print(url)
        do{
            let decoder = JSONDecoder()
            let jsonData = try Data(contentsOf: url!)
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let dataValue = try decoder.decode(CoinsModel.self, from: jsonData)
            onComplete(dataValue.data)
        }catch{
            onError("")
        }
    }
    
}
