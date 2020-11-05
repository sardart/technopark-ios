//
//  GreetingViewController.swift
//  MVC
//
//  Created by a.reshetnikov on 14/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController {

    var model: GreetingModel!

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: Any) {
        let text = model.prepareData()
        updateTextOnTheScreen(text)
        model.viewDidDisplayGreeting(comletion: { text in
            self.updateTextOnTheScreen(text)
        })
    }

    private func updateTextOnTheScreen(_ text: String) {
        self.myLabel.text = text
    }

}
