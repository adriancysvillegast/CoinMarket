//
//  CoinsListViewCell.swift
//  CoinMarket
//
//  Created by Adriancys Jesus Villegas Toro on 26/7/22.
//

import UIKit

class CoinsListViewCell: UITableViewCell {

    //MARK: - properties
    
    let identifier = "CoinsListViewCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 4
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 4
        label.text = "Price:"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 4
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 4
        label.text = "Last Update:"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lastUpdateValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 4
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - setupView
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [titleLabel, priceLabel, priceValue, lastUpdateLabel, lastUpdateValue].forEach {
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            priceValue.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            priceValue.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 5),
            
            lastUpdateLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            lastUpdateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            lastUpdateValue.topAnchor.constraint(equalTo: priceValue.bottomAnchor, constant: 5),
            lastUpdateValue.leadingAnchor.constraint(equalTo: lastUpdateLabel.trailingAnchor, constant: 5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configureCell
    
    func configureCell(model: CoinInfo) {
        self.titleLabel.text = model.symbol
        self.priceValue.text = String(format: "%.2f", model.quote.USD.price)
        self.lastUpdateValue.text = model.quote.USD.lastUpdated
    }
}
