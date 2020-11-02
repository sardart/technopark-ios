//
//  ViewController.swift
//  MVP
//
//  Created by a.reshetnikov on 14/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    @IBAction func didTapButton(_ sender: Any) {
        // Assembling of MVP
        let view = GreetingViewController(nibName: "GreetingViewController", bundle: nil)
        let presenter = GreetingPresenter(view: view)
        view.presenter = presenter
        self.present(view, animated: true, completion: nil)
    }

}

