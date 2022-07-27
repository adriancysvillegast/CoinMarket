//
//  CoinMarketTests.swift
//  CoinMarketTests
//
//  Created by Adriancys Jesus Villegas Toro on 25/7/22.
//

import XCTest
@testable import CoinMarket

class CoinMarketTests: XCTestCase {

    var sut: CoinsListViewModel!
    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        sut = nil
    }

    
    //MARK: - Test CoinsList
    
    func test_CoinsListViewModel_ShouldReturnData() {
        let mock = MockCoinsServiceSuccess()
        sut = CoinsListViewModel(service: mock)
        
        sut.service?.getCoinsList(onComplete: { coinsData in
            XCTAssertTrue(coinsData.count > 0)
        }, onError: { error in
            XCTAssertEqual(error, "")
        })
    }

    func test_CoinsListViewModel_ShouldReturnError() {
        let mock = MockCoinsServiceFail()
        sut = CoinsListViewModel(service: mock)
        
        sut.service?.getCoinsList(onComplete: { coins in
            XCTAssertTrue(coins.isEmpty)
        }, onError: { error in
            XCTAssertEqual(error, Constants.APIError.apiError)
        })
    }
}
