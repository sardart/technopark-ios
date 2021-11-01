//
//  ProductManager.swift
//  YoulaLight
//
//  Created by Artur Sardaryan on 13.10.2021.
//

import Foundation
import FirebaseFirestore

protocol ProductManagerProtocol {
    var output: ProductManagerOutput? { get set }
    
    func observeProducts()
    func create(product: Product)
}

protocol ProductManagerOutput: AnyObject {
    func didReceive(_ products: [Product])
    func didCreate(_ product: Product)
    func didFail(with error: Error)
}

enum NetworkError: Error {
    case unexpected
}

class ProductManager: ProductManagerProtocol {
    static let shared: ProductManagerProtocol = ProductManager()
    
    private let database = Firestore.firestore()
    private let productConverter = ProductConverter()
    
    weak var output: ProductManagerOutput?
    
    private init() {}
    
    func observeProducts() {
        database.collection("products").addSnapshotListener { [weak self] querySnapshot, error in
            if let error = error {
                self?.output?.didFail(with: error)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                self?.output?.didFail(with: NetworkError.unexpected)
                return
            }
            
            let product = documents.compactMap { self?.productConverter.product(from: $0) }
            self?.output?.didReceive(product)
        }
    }
    
    func create(product: Product) {
        database.collection("products").addDocument(data: productConverter.dict(from: product)) { [weak self] error in
            if let error = error {
                self?.output?.didFail(with: error)
            } else {
                self?.output?.didCreate(product)
            }
        }
    }
    
    func update(product: Product) {
//        database.collection("products").document(product.identifier).updateData([], completion: <#T##((Error?) -> Void)?##((Error?) -> Void)?##(Error?) -> Void#>)
    }
}

private final class ProductConverter {
    enum Key: String {
        case title
        case price
        case isFavorite
        case isVerified
        case imageName
    }
    
    func product(from document: DocumentSnapshot) -> Product? {
        guard let dict = document.data(),
              let title = dict[Key.title.rawValue] as? String,
              let price = dict[Key.price.rawValue] as? String,
              let isFavorite = dict[Key.isFavorite.rawValue] as? Bool,
              let isVerified = dict[Key.isVerified.rawValue] as? Bool else {
                  return nil
              }

//        let imageName = dict[Key.imageName.rawValue] as? String
        
        return Product(title: title,
                       price: price,
                       isFavorite: isFavorite,
                       isVerified: isVerified,
                       imageUrl: URL(string: "https://www.iphones.ru/wp-content/uploads/2018/11/01FBA0D1-393D-4E9F-866C-F26F60722480.jpeg"))
    }
    
    func dict(from product: Product) -> [String: Any] {
        var data: [String: Any] = [:]
        
        data[Key.title.rawValue] = product.title
        data[Key.price.rawValue] = product.price
        data[Key.isFavorite.rawValue] = product.isFavorite
        data[Key.isVerified.rawValue] = product.isVerified

        return data
    }
}
