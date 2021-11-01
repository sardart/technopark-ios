//
//  TableViewCell.swift
//  YoulaLight
//
//  Created by Artur Sardaryan on 13.10.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImageView: NetworkImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = .white
        backgroundColor = .systemGray5
        productImageView.contentMode = .scaleAspectFill
    }

    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = product.price
        favoriteButton.setImage(UIImage(named: product.isFavorite ? "favoriteActive" : "favoriteInactive"), for: .normal)
        productImageView.setURL(product.imageUrl)
    }
}
