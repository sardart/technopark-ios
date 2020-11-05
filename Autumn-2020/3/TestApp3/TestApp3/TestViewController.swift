//
//  TestViewController.swift
//  TestApp3
//
//  Created by Artur Sardaryan on 10/12/20.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var text: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = text
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "idsedasdfasdsfd" {
            (segue.destination as? TestViewController)?.text = "hello from segue"
        }
    }
}
