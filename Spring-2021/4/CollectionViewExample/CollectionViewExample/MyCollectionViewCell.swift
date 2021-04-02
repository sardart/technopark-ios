//
//  MyCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Artur Sardaryan on 3/22/21.
//

import UIKit
import Kingfisher

final class MyCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        backgroundColor = .secondarySystemBackground
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.pin.all()
    }
    
    func configure(with urlString: String) {
        imageView.kf.setImage(with: URL(string: urlString))
    }
}
