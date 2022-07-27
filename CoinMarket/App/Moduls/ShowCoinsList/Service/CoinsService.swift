//
//  CoinsService.swift
//  CoinMarket
//
//  Created by Adriancys Jesus Villegas Toro on 26/7/22.
//

import Foundation

protocol CoinsServiceFetching {
    func getCoinsList(onComplete: @escaping ([CoinInfo]) -> (), onError: @escaping (String) -> ())
}
class CoinsService: CoinsServiceFetching {
    private let baseURL = ProcessInfo.processInfo.environment["baseURL"]!
    private let endpointCurrency = ProcessInfo.processInfo.environment["endpointCurrency"]!
    private let apiKey = ProcessInfo.processInfo.environment["apiKey"]!
    
    func getCoinsList(onComplete: @escaping ([CoinInfo]) -> (), onError: @escaping (String) -> ()) {
        print("\(baseURL)\(endpointCurrency)limit=11&convert=USD&CMC_PRO_API_KEY=\(apiKey)")
        APIManager.share.get(url:"\(baseURL)\(endpointCurrency)limit=11&convert=USD&CMC_PRO_API_KEY=\(apiKey)") { response in
            switch response{
            case .success(let data):
                guard let safeData = data else { return }
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let coinsArray = try decoder.decode(CoinsModel.self, from: safeData)
                    onComplete(coinsArray.data)
                    print(coinsArray)
                }catch{
                    onError(Constants.APIError.apiError)
                }
            case .failure(let error):
                onError(error.localizedDescription)
            }
        }
    }
    
    
}
