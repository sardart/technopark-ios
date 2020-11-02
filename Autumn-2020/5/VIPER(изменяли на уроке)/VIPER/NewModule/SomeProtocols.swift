//
//  SomeProtocols.swift
//  VIPER
//
//  Created by p.nosov on 02.11.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import Foundation
import UIKit

protocol SomeModuleInput {
	var moduleOutput: SomeModuleOutput? { get }
}

protocol SomeModuleOutput: class {
    func didCloseView()
}

protocol SomeViewInput: class {
    func updateColor(_ color: UIColor)
}

protocol SomeViewOutput: class {
    var needToPresentNextController: Bool { get }
    func didTapButton()
    func readyToDisplayData()
}

protocol SomeInteractorInput: class {
}

protocol SomeInteractorOutput: class {
}

protocol SomeRouterInput: class {
    func showNewModule() 
}
