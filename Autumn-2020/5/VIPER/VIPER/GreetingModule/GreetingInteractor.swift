//
//  GreetingInteractor.swift
//  VIPER
//
//  Created by a.reshetnikov on 16.03.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import UIKit

class GreetingInteractor : GreetingProvider {
    weak var output: GreetingOutput!

    func provideGreetingData() {
        let person = Person(firstName: "David", lastName: "Blaine") // usually comes from data access layer
        let subject = person.firstName + " " + person.lastName
        let greeting = GreetingData(greeting: "Hello", subject: subject)
        self.output.receiveGreetingData(greetingData: greeting)
    }
}
