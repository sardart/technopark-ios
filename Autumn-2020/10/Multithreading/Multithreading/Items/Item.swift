//
//  Task.swift
//  Multithreading
//
//  Created by p.nosov on 26.11.2020.
//

import Foundation

class Item {
    let name: String

    init(name: String) {
        self.name = name
    }

    func prepare() {

    }

    func run() {
        prepare()
        print("________________________")
    }

    func end() {
        print("________________________")
    }
}
