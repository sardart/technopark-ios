//
//  CollectionModel.swift
//  YoulaLight
//
//  Created by Andrey Babkov on 27.10.2021.
//

protocol CollectionModelDescription: AnyObject {
    var output: CollectionViewControllerInput? { get set }
    
    func loadProducts()
}

final class CollectionModel: CollectionModelDescription {
    private var productManager: ProductManagerProtocol = ProductManager.shared
    
    weak var output: CollectionViewControllerInput?
    
    func loadProducts() {
        productManager.loadProducts()
        productManager.output = self
    }
}


extension CollectionModel: ProductManagerOutput {
    func didReceive(_ products: [Product]) {
        output?.didReceive(products)
    }
}
