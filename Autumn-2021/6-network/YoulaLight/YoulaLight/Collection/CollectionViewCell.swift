//
//  CollectionViewCell.swift
//  YoulaLight
//
//  Created by Artur Sardaryan on 13.10.2021.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var productImageView: NetworkImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var verifiedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        productImageView.contentMode = .scaleAspectFill
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .systemGray5
    }
    
    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = product.price
        favoriteButton.setImage(UIImage(named: product.isFavorite ? "favoriteActive" : "favoriteInactive"), for: .normal)
        verifiedImageView.isHidden = !product.isVerified
        productImageView.setURL(product.imageUrl)
    }

}
