//
//  CollectionProtocols.swift
//  Technoblog
//
//  Created by Artur Sardaryan on 4/12/21.
//  
//

import UIKit

typealias CollectionItem = PostViewModel

protocol CollectionModuleInput {
	var moduleOutput: CollectionModuleOutput? { get }
}

protocol CollectionModuleOutput: class {
}

protocol CollectionViewInput: class {
    func reloadData()
}

protocol CollectionViewOutput: class {
    var itemsCount: Int { get }
    
    func item(at index: Int) -> CollectionItem
    func didLoadView()
    func didTapCreateButton()
    func didSelectItem(at index: Int)
}

protocol CollectionInteractorInput: class {
    func createPost(with image: UIImage, title: String)
    func observePosts()
}

protocol CollectionInteractorOutput: class {
    func didLoad(posts: [Post])
    func didReceive(error: Error)
}

protocol CollectionRouterInput: class {
    func showImagePicker(output: ImagePickerOutput)
    func show(item: CollectionItem)
}
