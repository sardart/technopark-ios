//
//  Post.swift
//  PostsApp
//
//  Created by Artur Sardaryan on 4/12/21.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
