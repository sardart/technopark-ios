//
//  SomeRouter.swift
//  VIPER
//
//  Created by p.nosov on 02.11.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import UIKit

final class SomeRouter {
    weak var rootViewController: UIViewController?
}

extension SomeRouter: SomeRouterInput {

    func showNewModule() {
        let context = SomeContext(backgroundColor: .red, moduleOutput: nil)
        let container = SomeContainer.assemble(with: context)

        rootViewController?.present(container.viewController, animated: true, completion: nil)
    }
}
