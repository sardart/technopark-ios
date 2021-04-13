//
//  MyCollectionViewCell.swift
//  Technoblog
//
//  Created by Artur Sardaryan on 4/12/21.
//

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "MyCollectionViewCell"
    
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared

    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        contentView.addSubview(imageView)
        
        imageView.backgroundColor = .yellow
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = bounds
    }
    
    func configure(with imageName: String?) {
        imageView.image = nil

        guard let imageName = imageName else {
            return
        }
        
        imageLoader.image(with: imageName) { [weak self] (result) in
            switch result {
            case .success(let image):
                self?.imageView.image = image
            case .failure(let error):
                self?.imageView.image = nil
                print(error)
            }
        }
    }
}
