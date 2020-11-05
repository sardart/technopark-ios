//
//  GreetingViewController.swift
//  VIPER
//
//  Created by a.reshetnikov on 16.03.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import UIKit

protocol GreetingView: class {
    func setGreeting(greeting: String)
}

class GreetingViewController : UIViewController, GreetingView {
    var output: GreetingViewEventHandler!

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction
    func didTapButton(_ sender: Any) {
        output.didTapShowGreetingButton()
    }

    func setGreeting(greeting: String) {
        self.myLabel.text = greeting
    }

    // layout code goes here
}
