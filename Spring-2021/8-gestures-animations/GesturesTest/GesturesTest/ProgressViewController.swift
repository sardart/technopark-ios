//
//  UIViewController.swift
//  GesturesTest
//
//  Created by Artur Sardaryan on 5/5/21.
//

import UIKit

final class ProgressViewController: UIViewController {
    private let button = UIButton()
    private let progressView = ProgressView()
    private let manualProgressView = ManualProgressView()

    private let dataLoader = DataLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    private func setup() {
        dataLoader.delegate = self
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(progressView)
        view.addSubview(manualProgressView)
        view.addSubview(button)
        
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.setTitle("Start progress", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        progressView.frame = CGRect(x: 16, y: 48, width: view.bounds.width - 32, height: 40)
        
        manualProgressView.frame = CGRect(x: 16, y: 100, width: view.bounds.width - 32, height: 40)
        
        button.frame = CGRect(x: 16, y: view.bounds.height - 100, width: view.bounds.width - 32, height: 48)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        progressView.pause()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        progressView.resume()
    }
    
    @objc
    private func didTapButton() {
        progressView.start()
        dataLoader.startLoading()
    }
}

extension ProgressViewController: DataLoaderDelegate {
    func dataLoader(didUpdate progress: CGFloat) {
        manualProgressView.progress = progress
    }
}

protocol DataLoaderDelegate: AnyObject {
    func dataLoader(didUpdate progress: CGFloat)
}

final class DataLoader {
    weak var delegate: DataLoaderDelegate?
    
    var isLoading = false
    
    func startLoading() {
        guard !isLoading else {
            return
        }
        
        isLoading = true
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (_) in
            self?.delegate?.dataLoader(didUpdate: CGFloat.random(in: 0...1))
        }.fire()
    }
}
