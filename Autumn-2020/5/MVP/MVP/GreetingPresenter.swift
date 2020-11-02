//
//  GreetingPresenter.swift
//  MVP
//
//  Created by a.reshetnikov on 14/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import UIKit

class GreetingPresenter: GreetingViewPresenter {

    struct Person { // Model
        let firstName: String
        let lastName: String
    }

    unowned let view: GreetingView
    private let person: Person

    required init(view: GreetingView) {
        self.view = view
        self.person = Person(firstName: "David", lastName: "Blaine")
    }

    func showGreeting() {
        let greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
}
