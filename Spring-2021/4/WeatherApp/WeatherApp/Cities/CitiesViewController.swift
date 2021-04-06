//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 3/22/21.
//

import UIKit
import PinLayout

class CitiesViewController: UIViewController {
    private let model = CitiesModel()
    private let tableView = UITableView()
    private var citiesViewModels: [CityViewModel] = []

    private var cityServiceInfos: [CityServiceInfo] = [
        CityServiceInfo(name: "Moscow", id: "524901"),
        CityServiceInfo(name: "Dubai", id: "292223"),
    ]

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
        
        model.load(cities: cityServiceInfos)
        model.output = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.pin.all()
    }
    
    @objc
    private func didTapAddButton() {
    }
    
    @objc
    private func didPullRefesh() {
        model.load(cities: cityServiceInfos)
    }
}

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
            return .init()
        }
        
        cell.configure(with: citiesViewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = citiesViewModels[indexPath.row]
        let viewController = UIViewController()
        viewController.title = city.title
        viewController.view.backgroundColor = .systemBackground
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        present(navigationController, animated: true, completion: nil)
    }
}

extension CitiesViewController: CitiesModelOutput {
    func didLoad(cities: [CityResponse]) {
        tableView.refreshControl?.endRefreshing()
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        let citiesViewModels = cities.map { city in
            return CityViewModel(title: city.name,
                                 temperature: String(Int(round(city.main.temp))),
                                 dateUpdate: dateFormatter.string(from: Date()),
                                 systemImageName: "pencil")
        }
        
        self.citiesViewModels = citiesViewModels
        
        self.tableView.reloadData()
    }
}
