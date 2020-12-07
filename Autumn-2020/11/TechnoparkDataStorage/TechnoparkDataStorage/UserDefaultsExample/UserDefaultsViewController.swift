//
//  UserDefaultsViewController.swift
//  TechnoparkDataStorage
//
//  Created by Pavel Tikhonov on 06.12.2020.
//

import UIKit

class UserDefaultsViewController: UIViewController {
    
    @IBOutlet private weak var mySwitch: UISwitch!
    
    private let switchValDefaultsKey: String = "SwitchValueDefaultsKey"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "UserDefaults example"
        
        mySwitch.isOn = UserDefaults.standard.bool(forKey: switchValDefaultsKey)
    }
    
    @IBAction private func switchValueChanged(_ sender: UISwitch) {
        UserDefaults.standard.setValue(sender.isOn, forKey: switchValDefaultsKey)
    }

}
