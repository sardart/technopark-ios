//
//  ViewController.swift
//  VIPER
//
//  Created by a.reshetnikov on 16.03.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var router: MainRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: Any) {
        router = MainRouter(viewController: self)
        router.presentGreetingViewController()
    }
}
