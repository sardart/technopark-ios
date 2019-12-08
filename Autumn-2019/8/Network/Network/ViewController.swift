//
//  ViewController.swift
//  Network
//
//  Created by Artur Sardaryan on 11/11/19.
//  Copyright © 2019 Artur Sardaryan. All rights reserved.
//

import UIKit
import WebKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webView: WKWebView!
    
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.loadPosts { (posts) in
            print(posts)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let placeholder = UIImage(named: "s1200-2")
            let url = URL(string: "https://avatars.mds.yandex.net/get-pdb/2492590/8b90e2cc-9ad4-4821-8391-b7347370bff3/s1200")
            self.imageView.kf.setImage(with: url, placeholder: placeholder)
        }
        
        
        let urlString = "https://mail.ru"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
}
