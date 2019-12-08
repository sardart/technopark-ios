//
//  NetworkManager.swift
//  Network
//
//  Created by Artur Sardaryan on 11/11/19.
//  Copyright © 2019 Artur Sardaryan. All rights reserved.
//

import Foundation

final class NetworkManager {
    func loadPosts(comletion: (([Post]?) -> Void)?) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid url: \(urlString)")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                comletion?(nil)
                return
            }
            
            guard let data = data else {
                print("empty data")
                comletion?(nil)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let posts = try decoder.decode([Post].self, from: data)
                comletion?(posts)
            } catch let error {
                print(error.localizedDescription)
                comletion?(nil)
            }
        }.resume()
    }
}
