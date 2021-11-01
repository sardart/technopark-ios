//
//  ViewController.swift
//  PostsApp
//
//  Created by Artur Sardaryan on 4/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let networkManager: NetworkManagerDescription = NetworkManager.shared
    
    private let tableView = UITableView()
    private let activityIndicatorView = UIActivityIndicatorView()
    
    private var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupActivityIndicator()
        loadPosts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.frame
        
        activityIndicatorView.frame = CGRect(x: 140, y: 140, width: 40, height: 40)
    }
    
    private func setupActivityIndicator() {
        view.addSubview(activityIndicatorView)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        
        view.addSubview(tableView)
    }

    private func loadPosts() {
        activityIndicatorView.startAnimating()

        networkManager.posts { [weak self] (result) in
            self?.activityIndicatorView.stopAnimating()
            
            switch result {
            case .success(let posts):
                self?.posts = posts
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell
        
        let post = posts[indexPath.row]
        cell?.textLabel?.text = post.title
        
        return cell ?? .init()
    }
}

final class PostCell: UITableViewCell {
    
}
