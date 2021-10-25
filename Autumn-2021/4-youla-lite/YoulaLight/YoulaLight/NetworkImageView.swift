//
//  NetworkImageView.swift
//  YoulaLight
//
//  Created by Artur Sardaryan on 13.10.2021.
//

import UIKit
import Kingfisher

final class NetworkImageView: UIImageView {
    func setURL(_ url: URL?) {
        kf.setImage(with: url, placeholder: nil, options: nil, completionHandler: nil)
    }
}
