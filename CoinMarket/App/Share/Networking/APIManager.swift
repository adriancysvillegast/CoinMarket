//
//  APIManager.swift
//  CoinMarket
//
//  Created by Adriancys Jesus Villegas Toro on 26/7/22.
//

import Foundation
import Alamofire

class APIManager {
    
    static let share = APIManager()
    
    func get(url: String, completion: @escaping (Result<Data?,AFError>) -> () ) {
        AF.request(url).response{ response in
            completion(response.result)
        }
    }
}
