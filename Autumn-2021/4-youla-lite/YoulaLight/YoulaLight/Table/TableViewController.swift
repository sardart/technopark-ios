//
//  TableViewController.swift
//  YoulaLight
//
//  Created by Artur Sardaryan on 13.10.2021.
//

import UIKit

class TableViewController: UITableViewController {
    private var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        products = ProductManager.shared.loadProducts()
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
                             
        let product = products[indexPath.row]
        cell.configure(with: product)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        
        let viewController = ProductViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.product = product
        viewController.delegate = self
        
        present(navigationController, animated: true, completion: nil)
    }
}

extension TableViewController: ProductViewControllerDelegate {
    func didTapChatButton(productViewController: UIViewController, productId: String) {
        productViewController.dismiss(animated: true)
        
        let alertVC = UIAlertController(title: "Start Chat", message: productId, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertVC, animated: true, completion: nil)
    }
}
