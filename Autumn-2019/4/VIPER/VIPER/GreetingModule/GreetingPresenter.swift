//
//  GreetingPresenter.swift
//  VIPER
//
//  Created by a.reshetnikov on 16.03.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import UIKit

protocol GreetingOutput: class {
    func receiveGreetingData(greetingData: GreetingData)
}

protocol GreetingViewEventHandler {
    func didTapShowGreetingButton()
}

class GreetingPresenter : GreetingOutput, GreetingViewEventHandler {
    weak var view: GreetingView!
    var greetingProvider: GreetingProvider!

    func didTapShowGreetingButton() {
        self.greetingProvider.provideGreetingData()
    }

    func receiveGreetingData(greetingData: GreetingData) {
        let greeting = greetingData.greeting + " " + greetingData.subject
        self.view.setGreeting(greeting: greeting)
    }
}
