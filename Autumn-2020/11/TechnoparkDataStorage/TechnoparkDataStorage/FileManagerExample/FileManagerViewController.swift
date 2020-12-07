//
//  FileManagerViewController.swift
//  TechnoparkDataStorage
//
//  Created by Pavel Tikhonov on 06.12.2020.
//

import UIKit

class FileManagerViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    
    private let filename = "test.txt"
    private let fileEncoding: String.Encoding = .utf8

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = documentsDirUrl() else {
            return
        }
        
        let fileUrl = url.appendingPathComponent(filename)
        
        guard let content = try? String(contentsOf: fileUrl, encoding: fileEncoding) else {
            titleLabel.text = emptyLabelText()
            return
        }
        
        titleLabel.text = labelText(with: content)
    }
    
    @IBAction private func saveBtnTapped() {
        guard let userInput = textField.text, !userInput.isEmpty else {
            return
        }
        
        guard let url = documentsDirUrl() else {
            debugPrint("failed to get documents dir url")
            return
        }
        
        let fileUrl = url.appendingPathComponent(filename)
        let manager = FileManager.default
        
        var contents: String = ""
        
        if manager.fileExists(atPath: fileUrl.path) {
            contents = (try? String(contentsOf: fileUrl, encoding: fileEncoding)) ?? ""
        }
        
        contents = contents + "\n" + userInput
        
        do {
            try contents.write(to: fileUrl, atomically: true, encoding: fileEncoding)
            titleLabel.text = labelText(with: contents)
            textField.text = nil
        } catch {
            debugPrint(error)
        }
    }
    
    private func documentsDirUrl() -> URL? {
        try? FileManager.default.url(for: .documentDirectory,
                                     in: .userDomainMask,
                                     appropriateFor: nil,
                                     create: false)
    }
    
    private func labelText(with text: String) -> String {
        "Saved file: " + text
    }
    
    private func emptyLabelText() -> String {
        labelText(with: "empty")
    }
    
}
