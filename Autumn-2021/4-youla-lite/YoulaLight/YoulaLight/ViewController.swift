//
//  ViewController.swift
//  YoulaLight
//
//  Created by Artur Sardaryan on 13.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let someView = SomeView(frame: .init())
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        someView.backgroundColor = .red
        someView.delegate = self
        someView.dataSource = self
        
        view.addSubview(someView)
        someView.frame = view.frame
    }


}

extension ViewController: SomeViewDelegate, SomeViewDataSource {
    func color() -> UIColor {
        return .systemIndigo
    }
    
    func didTapButton() {
        print("hello from view contoller")
    }
}

protocol SomeViewDelegate: AnyObject {
    func didTapButton()
}

protocol SomeViewDataSource: AnyObject {
    func color() -> UIColor
}

class SomeView: UIView {
    
    private let button = UIButton()
    
    weak var delegate: SomeViewDelegate?
    weak var dataSource: SomeViewDataSource? {
        didSet {
            button.backgroundColor = dataSource?.color()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button.backgroundColor = dataSource?.color()
        button.layer.cornerRadius = 8
        button.setTitle("Hello World", for: .normal)
        
        addSubview(button)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.frame = CGRect(x: 12, y: 48, width: self.frame.width - 24, height: 48)
    }
    
    @objc
    func didTapButton() {
        delegate?.didTapButton()
    }
    
}
