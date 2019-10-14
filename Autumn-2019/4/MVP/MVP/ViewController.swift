//
//  ViewController.swift
//  MVP
//
//  Created by a.reshetnikov on 14/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import UIKit

struct Person { // Model
    let firstName: String
    let lastName: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    @IBAction func didTapButton(_ sender: Any) {
        // Assembling of MVP
        let model = Person(firstName: "David", lastName: "Blaine")
        let view = GreetingViewController(nibName: "GreetingViewController", bundle: nil)
        let presenter = GreetingPresenter(view: view, person: model)
        view.presenter = presenter
        self.present(view, animated: true, completion: nil)
    }

}

