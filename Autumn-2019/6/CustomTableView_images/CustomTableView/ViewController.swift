//
//  ViewController.swift
//  CustomTableView
//
//  Created by a.reshetnikov on 28/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    @IBAction func didTapButton(_ sender: Any) {
        let tableViewController = TableViewController(nibName: "TableViewController", bundle: nil)
        tableViewController.modalPresentationStyle = .fullScreen
        self.present(tableViewController, animated: true, completion: nil)
    }

}

