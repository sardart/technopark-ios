//
//  Product.swift
//  YoulaLight
//
//  Created by Artur Sardaryan on 13.10.2021.
//

import Foundation

struct Product {
    let identifier: String = UUID().uuidString
    let title: String
    let price: String
    let isFavorite: Bool
    let isVerified: Bool
    let imageUrl: URL?
}
