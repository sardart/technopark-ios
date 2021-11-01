//
//  ImageLoader.swift
//  YoulaLight
//
//  Created by Artur Sardaryan on 29.10.2021.
//

import Foundation
import FirebaseStorage
import SwiftUI


final class ImageLoader {
    let storage = Storage.storage().reference()
    
    
    func image(with name: String, completion: @escaping (UIImage?) -> Void) {
        storage.child(name).getData(maxSize: 15 * 1024 * 1024) { data, error in
            if let data = data {
                completion(UIImage(data: data))
            } else {
                completion(nil)
            }
        }
        
        //upload
        
//        let image = UIImage()
//
//        storage.child(name).putData(image.jpegData(compressionQuality: 0.8))
    }
    
    
}
