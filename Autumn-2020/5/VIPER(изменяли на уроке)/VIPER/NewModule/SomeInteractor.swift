//
//  SomeInteractor.swift
//  VIPER
//
//  Created by p.nosov on 02.11.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import Foundation

final class SomeInteractor {
	weak var output: SomeInteractorOutput?
}

extension SomeInteractor: SomeInteractorInput {
}
