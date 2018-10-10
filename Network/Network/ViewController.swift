//
//  ViewController.swift
//  Network
//
//  Created by Artur on 04/10/2018.
//  Copyright © 2018 Artur Sardaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var posts = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPosts()
    }
    
    func getPosts() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
        
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                self.parsePosts(from: json)
            } catch {
                print(error.localizedDescription)
            }
            
            }.resume()
    }
    
    func parsePosts(from json: Any) {
        guard let postsArray = json as? NSArray else {
            print("Parse error")
            return
        }
        
        var tmp = [Post]()
        for i in postsArray {
            guard let postDict = i as? NSDictionary,
                let post = Post(dict: postDict) else { continue }
            tmp.append(post)
        }
        self.posts = tmp
        
        guard let post = self.posts.first else { return }
        
        print("id: \(post.id)")
        print("title: \(post.title)")
        print("body: \(post.body)")
        print("user id: \(post.userId)")
    }
    
    
}

