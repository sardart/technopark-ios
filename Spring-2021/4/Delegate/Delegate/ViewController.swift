//
//  ViewController.swift
//  Delegate
//
//  Created by Artur Sardaryan on 10/19/20.
//

import UIKit

class ViewController: UIViewController {
    private let someView = SomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someView)
        someView.frame = view.frame
        someView.dataSource = self
        someView.delegate = self
    }
}

extension ViewController: SomeViewDataSource {
    func image() -> UIImage? {
        return UIImage(named: "pingvin-adeli-antarktida-more-led")
    }
    
    func title() -> String {
        return "hello world"
    }
}

extension ViewController: SomeViewDelegate {
    func didTapLabel() {
        // handle tap
        print("label tapped")
    }
}

protocol SomeViewDelegate: class {
    func didTapLabel()
}

protocol SomeViewDataSource: class {
    func title() -> String
    func image() -> UIImage?
}

final class SomeView: UIView {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    weak var delegate: SomeViewDelegate?
    weak var dataSource: SomeViewDataSource? {
        didSet {
            titleLabel.text = dataSource?.title()
            imageView.image = dataSource?.image()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.isUserInteractionEnabled = true
        titleLabel.textAlignment = .center
        imageView.contentMode = .scaleAspectFill
        
        backgroundColor = .systemIndigo
        
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapLabel)))
        
        addSubview(imageView)
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = frame
        titleLabel.frame = CGRect(x: 20, y: 40, width: frame.width - 40, height: 24)
    }
    
    @objc
    private func didTapLabel() {
        delegate?.didTapLabel()
    }
}
