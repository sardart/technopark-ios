//
//  NetworkManager.swift
//  PostsApp
//
//  Created by Artur Sardaryan on 4/12/21.
//

import Foundation

protocol NetworkManagerDescription: AnyObject {
    func posts(completion: @escaping (Result<[Post], Error>) -> Void)
}

enum NetworkError: Error {
    case unexepcted
}

final class NetworkManager: NetworkManagerDescription {
    static let shared: NetworkManagerDescription = NetworkManager()
    
    private init() {}

    func posts(completion: @escaping (Result<[Post], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion(.failure(NetworkError.unexepcted))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let mainThreadCompletion: (Result<[Post], Error>) -> Void = { result in
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            if let error = error {
                mainThreadCompletion(.failure(error))
                return
            }
            
            guard let data = data else {
                mainThreadCompletion(.failure(NetworkError.unexepcted))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let posts = try decoder.decode([Post].self, from: data)
                mainThreadCompletion(.success(posts))
            } catch let error  {
                mainThreadCompletion(.failure(error))
            }
        }.resume()
    }
}
