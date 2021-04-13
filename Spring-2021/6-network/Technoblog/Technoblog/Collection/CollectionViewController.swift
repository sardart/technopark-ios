//
//  CollectionViewController.swift
//  Technoblog
//
//  Created by Artur Sardaryan on 4/12/21.
//  
//

import UIKit
import PinLayout


final class CollectionViewController: UIViewController {
    private let createButton = UIButton()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
                
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
	private let output: CollectionViewOutput

    init(output: CollectionViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        
        setupCollectionView()
        setupCreateButton()
        output.didLoadView()
	}
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseIdentifier)
        
        view.addSubview(collectionView)
    }
    
    private func setupCreateButton() {
        createButton.setTitle("Create post", for: .normal)
        createButton.layer.cornerRadius = 8
        createButton.layer.masksToBounds = true
        createButton.backgroundColor = .systemTeal
        createButton.addTarget(self, action: #selector(didTapCreateButton), for: .touchUpInside)
        
        view.addSubview(createButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.pin.all()
        
        createButton.pin
            .bottom(view.pin.safeArea.bottom + 16)
            .height(48)
            .horizontally(16)
    }
    
    @objc
    private func didTapCreateButton() {
        output.didTapCreateButton()
    }
}

extension CollectionViewController: CollectionViewInput {
    func reloadData() {
        collectionView.reloadData()
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdentifier, for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = output.item(at: indexPath.item)
        cell.configure(with: item.image)
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.didSelectItem(at: indexPath.item)
    }
}
