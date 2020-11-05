//
//  ViewController.swift
//  ScrollView
//
//  Created by Artur Sardaryan on 10/19/20.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let imageView = UIImageView(image: UIImage(named: "pingvin-adeli-antarktida-more-led"))

    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        scrollView.frame = view.frame
        scrollView.contentSize = imageView.image?.size ?? .zero
        
        scrollView.delegate = self
    }
    
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("bounds: \(scrollView.bounds)")
        print("frame: \(scrollView.frame)")
        print("contentOffset: \(scrollView.contentOffset)")
    }
}
