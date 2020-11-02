//
//  GreetingModel.swift
//  MVC
//
//  Created by p.nosov on 01.11.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import UIKit



final class GreetingModel {
    
    func prepareData() -> String {
        return  "Hello David Blaine"
    }

    func viewDidDisplayGreeting(comletion: @escaping ((String) -> ())) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            comletion("HAVE A NICE DAY")
        }
    }
}
