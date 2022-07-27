//
//  CoinsDetailsViewModel.swift
//  CoinMarket
//
//  Created by Adriancys Jesus Villegas Toro on 27/7/22.
//

import Foundation

protocol CoinsDetailDelegate: AnyObject {
    func updateView(data: CoinInfo)
}

class CoinsDetailsViewModel {
    
    weak var delegate: CoinsDetailDelegate?
    
    func getCoinDetail(data: CoinInfo?) {
        if let data = data{
            self.delegate?.updateView(data: data)
        }
    }
}
