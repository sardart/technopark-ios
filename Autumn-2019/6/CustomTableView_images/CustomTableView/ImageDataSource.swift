//
//  ImageDataSource.swift
//  CustomTableView
//
//  Created by a.reshetnikov on 28/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import Foundation
import UIKit

let baseUrl = "https://robohash.org/"

class ImageDataSource {
    private var images = (1...200).map {
        ImageModel(url: baseUrl + "\($0).png", order: $0)
    }

    public var numberOfImages: Int {
        return images.count
    }

    public func loadImage(at index: Int) -> DataLoadOperation? {
        if (0..<images.count).contains(index) {
            return DataLoadOperation(images[index])
        }
        return nil
    }
}

class DataLoadOperation: Operation {
    var image: UIImage?
    var loadingCompletionHandler: ((UIImage?) -> ())?
    private var _image: ImageModel
    init(_ image: ImageModel) {
        _image = image
    }

    override func main() {
        if isCancelled { return }
        guard let url = _image.url else { return }
        downloadImageFromURL(url) { (image) in
            DispatchQueue.main.async() { [weak self] in
                guard let `self` = self else { return }
                if self.isCancelled { return }
                self.image = image
                self.loadingCompletionHandler?(self.image)
            }
        }
    }
}

func downloadImageFromURL(_ url: URL, completionHandler: @escaping (UIImage?) -> ()) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard
            let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let newImage = UIImage(data: data)
            else { return }
        completionHandler(newImage)
    }.resume()
}
