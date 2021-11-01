//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 29.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        WeatherManager.shared.loadCities(with: ["524901", "292223"]) { result in
            print(result)
        }
    }


}

