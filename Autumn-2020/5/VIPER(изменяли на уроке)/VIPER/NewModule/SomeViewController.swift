//
//  SomeViewController.swift
//  VIPER
//
//  Created by p.nosov on 02.11.2020.
//  Copyright © 2020 MIPT. All rights reserved.
//

import UIKit

final class SomeViewController: UIViewController {
	private let output: SomeViewOutput

    init(output: SomeViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .gray
        if output.needToPresentNextController {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { 
                self.output.didTapButton()
            }
        }

        output.readyToDisplayData()
	}
}

extension SomeViewController: SomeViewInput {
    func updateColor(_ color: UIColor) {
        self.view.backgroundColor = color
    }

}
