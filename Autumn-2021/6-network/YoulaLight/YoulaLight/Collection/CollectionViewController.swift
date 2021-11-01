//
//  CollectionViewController.swift
//  YoulaLight
//
//  Created by Artur Sardaryan on 13.10.2021.
//

import Foundation
import UIKit

protocol CollectionViewControllerInput: AnyObject {
    func didReceive(_ products: [Product])
}

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellHeight: CGFloat = 240
    private let cellsOffset: CGFloat = 8
    private let numberOfItemsPerRow: CGFloat = 2
    
    private let model: CollectionModelDescription = CollectionModel()
    
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //products = ProductManager.shared.loadProducts()
        model.loadProducts()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.register(.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        model.output = self
    }    
}

extension CollectionViewController: CollectionViewControllerInput {
    func didReceive(_ products: [Product]) {
        self.products = products
        collectionView.reloadData()
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return .init()
        }
        
        let product = products[indexPath.row]
        cell.configure(with: product)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.item]
        
        let viewController = ProductViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.product = product
        viewController.delegate = self

        present(navigationController, animated: true, completion: nil)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.frame.width - cellsOffset * (numberOfItemsPerRow + 1)
        let cellWidth = availableWidth / numberOfItemsPerRow
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: cellsOffset, bottom: 0, right: cellsOffset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellsOffset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellsOffset
    }
}

extension CollectionViewController: ProductViewControllerDelegate {
    func didTapChatButton(productViewController: UIViewController, productId: String) {
        productViewController.dismiss(animated: true)
        
        let alertVC = UIAlertController(title: "Start Chat", message: productId, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertVC, animated: true, completion: nil)
    }
}
