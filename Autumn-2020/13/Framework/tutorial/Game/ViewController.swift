//
//  ViewController.swift
//  Game
//
//  Created by p.nosov on 20.12.2020.
//

import UIKit
import tutorial

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let character = GameCharacter(name: "First")
        debugPrint(character.name)
        let level = GameLevel()
        level.add(character)

        for character in level.allCharacters() {
            debugPrint(character.name)
        }

        displayControllerFromBundleWithoutName()

    }

    func displayControllerFromBundle() {
        let bundle = Bundle(identifier: "test.tutorial")
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let initialVC = storyboard.instantiateInitialViewController()

        navigationController?.present(initialVC!, animated: true, completion: nil)
    }

    func displayControllerFromBundleWithoutName() {
        let myBundle = Bundle(for: GameCharacter.self)
        let storyboard = UIStoryboard(name: "Main", bundle: myBundle)
        let initialVC = storyboard.instantiateInitialViewController()
        navigationController?.present(initialVC!, animated: true, completion: nil)

    }


}

