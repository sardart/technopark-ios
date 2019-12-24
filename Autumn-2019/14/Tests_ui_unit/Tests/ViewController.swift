//
//  ViewController.swift
//  Tests
//
//  Created by Gennady Evstratov on 11/29/17.
//  Copyright © 2017 Gennady Evstratov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let multiplier = MultiplierServiceImpl()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: Any?) {
        guard let numStr = textField.text, let num = Int(numStr) else {
            NSLog("bad number");
            return;
        }
        
        label?.text = "\(multiplier.mul(num))"
    }

}

