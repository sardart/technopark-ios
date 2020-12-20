//
//  GameCharacter.swift
//  tutorial
//
//  Created by p.nosov on 20.12.2020.
//

import Foundation

public class GameCharacter: NSObject {

    public let name: String

    @objc
    public init(name: String) {
        self.name = name
    }
}
