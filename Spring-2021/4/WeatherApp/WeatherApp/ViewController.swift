//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 3/22/21.
//

import UIKit
import PinLayout

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    private var cities: [City] = [
        City(title: "Moscow", temperature: -2, dateUpdated: Date(timeIntervalSinceNow: -300), systemImageName: "pencil"),
        City(title: "London", temperature: -7, dateUpdated: Date(), systemImageName: "pencil"),
        City(title: "Paris", temperature: 37, dateUpdated: Date(), systemImageName: "pencil"),
        City(title: "Bangkok", temperature: 35, dateUpdated: Date(), systemImageName: "pencil"),
        City(title: "New York", temperature: 10, dateUpdated: Date(), systemImageName: "pencil"),
        City(title: "Belgorod", temperature: 50, dateUpdated: Date(), systemImageName: "pencil"),
        City(title: "Barnaul", temperature: -40, dateUpdated: Date(), systemImageName: "pencil"),
        City(title: "Sochi", temperature: 12, dateUpdated: Date(), systemImageName: "pencil"),
        City(title: "Oslo", temperature: -5, dateUpdated: Date(), systemImageName: "pencil")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAddButton))
        
        title = "Cities"
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.pin.all()
    }
    
    @objc
    private func didTapAddButton() {
        let city = City(title: "New City", temperature: 273, dateUpdated: .init(), systemImageName: "pencil")
        cities.insert(city, at: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .left)
        tableView.endUpdates()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
            return .init()
        }
        
        cell.configure(with: cities[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = cities[indexPath.row]
        let viewController = UIViewController()
        viewController.title = city.title
        viewController.view.backgroundColor = .systemBackground
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        present(navigationController, animated: true, completion: nil)
    }
}
