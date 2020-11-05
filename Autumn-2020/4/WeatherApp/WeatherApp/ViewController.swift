//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 10/19/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var models: [CityTableViewCellModel] = [
        CityTableViewCellModel(imageName: "cloudy", title: "Moscow", timeString: "7:42", temperature: 10),
        CityTableViewCellModel(imageName: "cloudy", title: "London", timeString: "8:42", temperature: 15),
        CityTableViewCellModel(imageName: "cloudy", title: "Paris", timeString: "9:42", temperature: 20)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "Weather App"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        
        let addButton = UIBarButtonItem(systemItem: .add)
        navigationItem.rightBarButtonItem = addButton
    }

    @objc
    private func didTapAddButton() {
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "city", for: indexPath) as? CityTableViewCell else {
            return UITableViewCell()
        }
                
        cell.configure(with: models[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = models[indexPath.row].title
        
        let cityViewController = CityViewController()
        cityViewController.title = title
        
        let navigationController = UINavigationController(rootViewController: cityViewController)
        present(navigationController, animated: true, completion: nil)
//        navigationController?.pushViewController(cityViewController, animated: true)
    }
}
