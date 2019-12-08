//
//  Post.swift
//  Network
//
//  Created by Artur Sardaryan on 11/11/19.
//  Copyright © 2019 Artur Sardaryan. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
