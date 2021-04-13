//
//  PostsManager.swift
//  Technoblog
//
//  Created by Artur Sardaryan on 4/12/21.
//

import Foundation
import FirebaseFirestore

enum NetworkError: Error {
    case unexpected
}

protocol PostsManagerDescription {
    func create(post: NewPost, completion: @escaping (Error?) -> Void)
    func observePosts(completion: @escaping (Result<[Post], Error>) -> Void)
}

final class PostsManager: PostsManagerDescription {
    static let shared: PostsManagerDescription = PostsManager()
    
    private let database = Firestore.firestore()
    
    private init() {}
    
    func create(post: NewPost, completion: @escaping (Error?) -> Void) {
        let data = PostConverter.dict(from: post)
        database.collection("posts").addDocument(data: data, completion: completion)
    }
    
    func observePosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        database.collection("posts").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                completion(.failure(NetworkError.unexpected))
                return
            }
            
            let posts = documents.compactMap { PostConverter.post(from: $0) }
            completion(.success(posts))
        }
    }
}

private final class PostConverter {
    enum Key: String {
        case title
        case identifier
        case image
    }
    
    static func post(from document: DocumentSnapshot) -> Post? {
        guard
            let dict = document.data(),
            let title = dict[Key.title.rawValue] as? String
        else {
            return nil
        }
        
        let image = dict[Key.image.rawValue] as? String
        
        return Post(identifier: document.documentID, title: title, image: image)
    }
    
    static func dict(from post: NewPost) -> [String: Any] {
        var data: [String: Any] = [:]
        
        data[Key.title.rawValue] = post.title
        post.image.map { data[Key.image.rawValue] = $0 }
        
        return data
    }
}
