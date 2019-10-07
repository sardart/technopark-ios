//
//  SegueViewController.swift
//  lecture3App
//
//  Created by Artur Sardaryan on 10/7/19.
//  Copyright © 2019 Artur Sardaryan. All rights reserved.
//

import UIKit

class SegueViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!

    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = text
    }
    
    deinit {
        print("SegueViewController deallocated")
    }
}
