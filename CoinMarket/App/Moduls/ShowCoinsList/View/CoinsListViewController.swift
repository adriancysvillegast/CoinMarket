//
//  CoinsListViewController.swift
//  CoinMarket
//
//  Created by Adriancys Jesus Villegas Toro on 25/7/22.
//

import UIKit

class CoinsListViewController: UIViewController {

    //MARK: - Properties
    
    private lazy var viewModel: CoinsListViewModel = {
        let viewModel = CoinsListViewModel()
        viewModel.delegate = self
        viewModel.delegateSpinner = self
        return viewModel
    }()
    
    private lazy var buttonItemUpdate: UIBarButtonItem = {
        let item = UIBarButtonItem(barButtonSystemItem: .refresh,
                                   target: self, action: #selector(updateData))
        return item
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 85
        tableView.register(CoinsListViewCell.self, forCellReuseIdentifier: CoinsListViewCell().identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.isHidden = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    //MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crypto Currency"
        setupView()
        setupConstrainsts()
        
        viewModel.getCoins()
    }
    
    //MARK: - setupView
    
    private func setupView() {
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = buttonItemUpdate
        [tableView, spinner].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstrainsts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //MARK: - updateData
    
    @objc func updateData(){
        viewModel.getCoins()
    }
}
//MARK: - UITableViewDelegate, UITableViewDataSource
extension CoinsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCoinsDataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinsListViewCell().identifier, for: indexPath) as? CoinsListViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(model: viewModel.getCoinsData(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = CoinsDetailsViewController()
        detailVC.coinDetail = viewModel.getCoinsData(index: indexPath.row)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
}

//MARK: - CoinsListViewModelDelegate
extension CoinsListViewController: CoinsListViewModelDelegate, SpinnerLoading {

//    CoinsListViewModelDelegate
    func hideProperties() {
        [tableView].forEach { view in
            view.isHidden = true
        }
    }
    
    func showProperties() {
        [tableView].forEach { view in
            view.isHidden = false
        }
    }
    
    func updateTableView() {
        tableView.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: Constants.messageError.titleError, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
//    SpinnerLoading
    func showSpinner() {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        spinner.isHidden = true
        spinner.stopAnimating()
    }
}
