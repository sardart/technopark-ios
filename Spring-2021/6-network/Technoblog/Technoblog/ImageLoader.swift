//
//  ImageLoader.swift
//  Technoblog
//
//  Created by Artur Sardaryan on 4/12/21.
//

import FirebaseStorage


protocol ImageLoaderDescription: AnyObject {
    func upload(image: UIImage, completion: @escaping (Result<String, Error>) -> Void)
    func image(with name: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}

final class ImageLoader: ImageLoaderDescription {
    static let shared: ImageLoaderDescription = ImageLoader()
    
    private let storageRef = Storage.storage().reference()
    
    private var imageCache: [String: UIImage] = [:]
    
    private init() {}
    
    func upload(image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        guard let data = image.jpegData(compressionQuality: 0.5) else {
            completion(.failure(NetworkError.unexpected))
            return
        }
        
        
        let metedata = StorageMetadata()
        metedata.contentType = "image/jpeg"
        let randomName = UUID().uuidString
        
        storageRef.child(randomName).putData(data, metadata: metedata) { [weak self] (_, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                self?.imageCache[randomName] = image
                completion(.success(randomName))
            }
        }
    }
    
    func image(with name: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let image = imageCache[name] {
            completion(.success(image))
            return
        }
        
        storageRef.child(name).getData(maxSize: 15 * 1024 * 1024) { [weak self] (data, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let image = UIImage(data: data) {
                self?.imageCache[name] = image
                completion(.success(image))
            } else {
                completion(.failure(NetworkError.unexpected))
            }
        }
    }
}
