//
//  ViewController.swift
//  Collection
//
//  Created by Artur Sardaryan on 10/19/20.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
                
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    var urls: [String] = [
        "https://is4-ssl.mzstatic.com/image/thumb/Purple123/v4/8e/47/7c/8e477c39-39b7-7cdf-0a49-999131ed996a/source/512x512bb.jpg",
        "https://cdn.jim-nielsen.com/ios/1024/weather-fine-2016-03-15.png",
        "https://iphone-image.apkpure.com/v2/app/0/4/2/042a955bdd194eaca834a948127ae474.jpg"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseIdentifier)
        
        view.addSubview(collectionView)
        collectionView.frame = view.frame
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdentifier, for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let url = urls[indexPath.item % urls.count]
        cell.configure(with: URL(string: url))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = (collectionView.frame.width - 2)
        let sideLength = availableWidth / 3
        
        return CGSize(width: sideLength, height: sideLength)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}

final class MyCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "MyCollectionViewCell"
    
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
    
    func configure(with imageUrl: URL?) {
        imageView.kf.setImage(with: imageUrl)
    }
}
