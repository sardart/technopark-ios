//
//  ProfileViewController.swift
//  TestApp3
//
//  Created by Artur Sardaryan on 10/12/20.
//

import UIKit

struct Profile {
    let username: String
    let title: String
    let subtitle: String
    let posts: String
    let followers: String
    let following: String
    
    static let test: Profile = Profile(username: "apple",
                                       title: "Hello",
                                       subtitle: "World",
                                       posts: "123",
                                       followers: "250M",
                                       following: "300")
}


class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    // MARK: - Lify Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.layer.cornerRadius = 40
        buttons.forEach { $0.layer.cornerRadius = 8 }
        
        configure(with: Profile.test)
        
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapTitleLabel)))
    }
    
    // MARK: - Configure
    
    func configure(with model: Profile) {
        title = model.username
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        postsLabel.text = model.posts
        followersLabel.text = model.followers
        followingLabel.text = model.following
    }
    
    // MARK: - Actions
    
    @objc
    private func didTapTitleLabel() {
        print(#function)
    }
    
    @IBAction func didTapBarButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Test", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "TestViewController") as? TestViewController
        
        guard let testViewController = viewController else {
            return
        }
        
        testViewController.text = "hello from profile view controller"
        
        present(testViewController, animated: true) {
            print("viewController presented")
        }
    }
}
