//
//  CollectionInteractor.swift
//  Technoblog
//
//  Created by Artur Sardaryan on 4/12/21.
//  
//

import UIKit

final class CollectionInteractor {
    private let postsManager: PostsManagerDescription = PostsManager.shared
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared

    weak var output: CollectionInteractorOutput?
    
    private func create(post: NewPost) {
        postsManager.create(post: post) { [weak output] (error) in
            error.map { output?.didReceive(error: $0) }
        }
    }
}

extension CollectionInteractor: CollectionInteractorInput {
    func createPost(with image: UIImage, title: String) {
        imageLoader.upload(image: image) { [weak self] (result) in
            switch result {
            case .success(let name):
                self?.create(post: NewPost(title: title, image: name))
            case .failure(let error):
                self?.output?.didReceive(error: error)
            }
        }
    }
    
    func observePosts() {
        postsManager.observePosts { [weak self] (result) in
            switch result {
            case .success(let posts):
                self?.output?.didLoad(posts: posts)
            case .failure(let error):
                self?.output?.didReceive(error: error)
            }
        }
    }
}
