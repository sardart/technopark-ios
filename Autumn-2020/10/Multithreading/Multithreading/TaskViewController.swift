//
//  ThreadViewController.swift
//  Multithreading
//
//  Created by p.nosov on 26.11.2020.
//

//import Foundation
import UIKit

class TaskViewController: UIViewController {

    var item: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = item?.name
        item?.run()
    }


}
