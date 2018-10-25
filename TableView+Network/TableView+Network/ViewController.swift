//
//  ЗщыеViewController.swift
//  TableView+Network
//
//  Created by Artur on 25/10/2018.
//  Copyright © 2018 Artur Sardaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
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
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.postTitle.text = posts[indexPath.row].title

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
