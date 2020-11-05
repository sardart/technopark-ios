//
//  SomeInteractor.swift
//  VIPER
//
//  Created by p.nosov on 02.11.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import UIKit

class NewInteractor: GreetingProvider {
    weak var output: GreetingOutput!

    func provideGreetingData() {
        let grData = GreetingData(greeting: "Some",
                                  subject: "Data")
        output.receiveGreetingData(greetingData: grData)
    }
}
