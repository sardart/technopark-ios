//
//  ImageModel.swift
//  CustomTableView
//
//  Created by a.reshetnikov on 28/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import Foundation
import UIKit

class ImageModel {
    public var url: URL?
    let order: Int

    init(url: String?, order: Int) {
        self.url = url?.toURL
        self.order = order
    }
}

public extension String {
    var toURL: URL? {
        return URL(string: self)
    }
}
