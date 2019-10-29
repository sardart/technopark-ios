//
//  ViewController.swift
//  LessonTableView
//
//  Created by a.reshetnikov on 28/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: Any) {
        let tableViewController = TableView(nibName: "TableView", bundle: nil)
        self.present(tableViewController, animated: true, completion: nil)
    }

}

