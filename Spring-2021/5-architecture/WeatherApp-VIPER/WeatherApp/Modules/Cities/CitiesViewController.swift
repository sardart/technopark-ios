//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 3/22/21.
//

import UIKit
import PinLayout

class CitiesViewController: UIViewController {
    private let tableView = UITableView()
    private let output: CitiesViewOutput
    
    init(output: CitiesViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAddButton))
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        title = "Cities"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullRefesh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
        
        view.addSubview(tableView)
    
        output.didLoadView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.pin.all()
    }
    
    @objc
    private func didTapAddButton() {
        output.didTapAddButton()
    }
    
    @objc
    private func didPullRefesh() {
        output.didPullRefesh()
    }
}

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.citiesViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
            return .init()
        }
        
        cell.configure(with: output.citiesViewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = output.citiesViewModels[indexPath.row]
        let viewController = UIViewController()
        viewController.title = city.title
        viewController.view.backgroundColor = .systemBackground
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        present(navigationController, animated: true, completion: nil)
    }
}

extension CitiesViewController: CitiesViewInput {
    func reloadData() {
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
}
