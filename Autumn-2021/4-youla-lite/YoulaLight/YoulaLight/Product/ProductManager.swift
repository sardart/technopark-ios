//
//  ProductManager.swift
//  YoulaLight
//
//  Created by Artur Sardaryan on 13.10.2021.
//

import Foundation

protocol ProductManagerProtocol {
    var output: ProductManagerOutput? { get set }
    
    func loadProducts()
}

protocol ProductManagerOutput: AnyObject {
    func didReceive(_ products: [Product])
}

class ProductManager: ProductManagerProtocol {
    static let shared: ProductManagerProtocol = ProductManager()
    
    weak var output: ProductManagerOutput?
    
    private init() {}
    
    func loadProducts() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let products = [
                Product(title: "iPad Mini 2030", price: "499 $", isFavorite: Bool.random(), isVerified: Bool.random(), imageUrl: URL(string: "https://www.iphones.ru/wp-content/uploads/2018/11/01FBA0D1-393D-4E9F-866C-F26F60722480.jpeg")),
                Product(title: "iPhone 13 Pro", price: "1299 $", isFavorite: Bool.random(), isVerified: Bool.random(), imageUrl: URL(string: "https://berryblog.ru/wp-content/uploads/2017/09/gettyimages-846148982.jpg")),
                Product(title: "Apple Watch 7", price: "499 $", isFavorite: Bool.random(), isVerified: Bool.random(), imageUrl: URL(string: "https://pbs.twimg.com/media/DnFbBdYVsAAqnXN.jpg"))
            ]
            
            self.output?.didReceive(products)
        }
    }
}
