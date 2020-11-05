//
//  GreetingViewController.swift
//  MVVM
//
//  Created by a.reshetnikov on 14/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController {

    var viewModel: GreetingViewModelProtocol! {
        didSet {
            viewModel.greetingDidChange = { [unowned self] viewModel in
                self.myLabel.text = viewModel.greeting
            }
        }
    }

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!

    @IBAction func didTapButton(_ sender: Any) {
        viewModel.showGreeting()
    }
}
