//
//  CoinsDetailsViewController.swift
//  CoinMarket
//
//  Created by Adriancys Jesus Villegas Toro on 27/7/22.
//

import UIKit

class CoinsDetailsViewController: UIViewController {

    //MARK: - Properties
    
    var coinDetail: CoinInfo?
    
    private lazy var viewModel: CoinsDetailsViewModel = {
        let viewModel = CoinsDetailsViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    private lazy var coinIcon: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Name:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var numberMarketPairsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Number Market Pairs:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var numberMarketPairsValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateAdddedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Date Added:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateAddedValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Price(USD):"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var marketCapLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Market Cap:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var marketCapValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Last Update:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lastUpdateValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        viewModel.getCoinDetail(data: coinDetail)
    }
    

    //MARK: - setup View
    
    private func setupView() {
        view.backgroundColor = .white
        [coinIcon, nameLabel, nameValue, numberMarketPairsLabel, numberMarketPairsValue, dateAdddedLabel, dateAddedValue, priceLabel, priceValue, marketCapLabel, marketCapValue, lastUpdateLabel, lastUpdateValue].forEach{
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            coinIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            coinIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: coinIcon.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            nameValue.topAnchor.constraint(equalTo: coinIcon.bottomAnchor, constant: 10),
            nameValue.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            
            numberMarketPairsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            numberMarketPairsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            numberMarketPairsValue.topAnchor.constraint(equalTo: nameValue.bottomAnchor, constant: 10),
            numberMarketPairsValue.leadingAnchor.constraint(equalTo: numberMarketPairsLabel.trailingAnchor, constant: 5),
            
            dateAdddedLabel.topAnchor.constraint(equalTo: numberMarketPairsLabel.bottomAnchor, constant: 10),
            dateAdddedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            dateAddedValue.topAnchor.constraint(equalTo: numberMarketPairsValue.bottomAnchor, constant: 10),
            dateAddedValue.leadingAnchor.constraint(equalTo: dateAdddedLabel.trailingAnchor, constant: 5),
            
            priceLabel.topAnchor.constraint(equalTo: dateAdddedLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            priceValue.topAnchor.constraint(equalTo: dateAddedValue.bottomAnchor, constant: 10),
            priceValue.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 5),
            
            marketCapLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            marketCapLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            marketCapValue.topAnchor.constraint(equalTo: priceValue.bottomAnchor, constant: 10),
            marketCapValue.leadingAnchor.constraint(equalTo: marketCapLabel.trailingAnchor, constant: 5),
            
            lastUpdateLabel.topAnchor.constraint(equalTo: marketCapLabel.bottomAnchor, constant: 10),
            lastUpdateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            lastUpdateValue.topAnchor.constraint(equalTo: marketCapValue.bottomAnchor, constant: 10),
            lastUpdateValue.leadingAnchor.constraint(equalTo: lastUpdateLabel.trailingAnchor, constant: 5),
        ])
    }
}

//MARK: - CoinsDetailDelegate

extension CoinsDetailsViewController: CoinsDetailDelegate {
    func updateView(data: CoinInfo) {
        self.coinIcon.text = data.symbol
        self.nameValue.text = data.name
        self.numberMarketPairsValue.text = String(data.numMarketPairs)
        self.dateAddedValue.text = data.dateAdded
        self.priceValue.text = String(format: "%.2f" ,data.quote.USD.price)
        self.marketCapValue.text = String(data.quote.USD.marketCap)
        self.lastUpdateValue.text = data.quote.USD.lastUpdated
    }
    
    
}
