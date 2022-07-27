//
//  CoinsListViewModel.swift
//  CoinMarket
//
//  Created by Adriancys Jesus Villegas Toro on 26/7/22.
//

import Foundation

protocol CoinsListViewModelDelegate: AnyObject {
    func showError(message: String)
    func updateTableView()
    func hideProperties()
    func showProperties()
}

class CoinsListViewModel {
    //MARK: - properties
    
    var service: CoinsServiceFetching?
    weak var delegate: CoinsListViewModelDelegate?
    weak var delegateSpinner: SpinnerLoading?
    var coinsData: [CoinInfo] = []
    
    //MARK: - Init service
    
    init(service: CoinsServiceFetching = CoinsService()){
        self.service = service
    }
    
    //MARK: - Get CoinsData
    
    func getCoins(){
        self.coinsData = []
        self.delegate?.hideProperties()
        self.delegateSpinner?.showSpinner()
        service?.getCoinsList(onComplete: { coins in
            self.coinsData = coins
            self.delegateSpinner?.hideSpinner()
            self.delegate?.updateTableView()
            self.delegate?.showProperties()
        }, onError: { error in
            self.delegate?.showError(message: error)
            self.delegate?.showProperties()
        })
    }
    
    func getCoinsDataCount() -> Int {
        coinsData.count
    }
    
    func getCoinsData(index: Int) -> CoinInfo {
        coinsData[index]
    }
}
