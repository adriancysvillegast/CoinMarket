//
//  MockCoinsServiceFail.swift
//  CoinMarketTests
//
//  Created by Adriancys Jesus Villegas Toro on 27/7/22.
//

import Foundation
@testable import CoinMarket

class MockCoinsServiceFail : CoinsServiceFetching {
    func getCoinsList(onComplete: @escaping ([CoinInfo]) -> (), onError: @escaping (String) -> ()) {
        onError(Constants.APIError.apiError)
    }
    
    
}
