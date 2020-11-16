//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 11/16/20.
//  
//

import UIKit

final class CitiesViewController: AGViewController {
	private let output: CitiesViewOutput

    init(output: CitiesViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension CitiesViewController: CitiesViewInput {
}
