//
//  CollectionPresenter.swift
//  Technoblog
//
//  Created by Artur Sardaryan on 4/12/21.
//  
//

import UIKit

final class CollectionPresenter {
	weak var view: CollectionViewInput?
    weak var moduleOutput: CollectionModuleOutput?

	private let router: CollectionRouterInput
	private let interactor: CollectionInteractorInput
    
    private var items: [CollectionItem] = []

    init(router: CollectionRouterInput, interactor: CollectionInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    private func collectionItem(from post: Post) -> CollectionItem {
        return PostViewModel(title: post.title, image: post.image)
    }
}

extension CollectionPresenter: CollectionModuleInput {
}

extension CollectionPresenter: CollectionViewOutput {
    var itemsCount: Int { items.count }
    
    func item(at index: Int) -> CollectionItem {
        return items[index]
    }
    
    func didLoadView() {
        interactor.observePosts()
    }
    
    func didTapCreateButton() {
        router.showImagePicker(output: self)
    }
    
    func didSelectItem(at index: Int) {
        router.show(item: items[index])
    }
}

extension CollectionPresenter: CollectionInteractorOutput {
    func didLoad(posts: [Post]) {
        self.items = posts.map { collectionItem(from: $0) }
        view?.reloadData()
    }
    
    func didReceive(error: Error) {
        // show error
    }
    
}

extension CollectionPresenter: ImagePickerOutput {
    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }
        
        interactor.createPost(with: image, title: "Test title")
    }
}
