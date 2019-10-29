//
//  CustomTableViewCell.swift
//  CustomTableView
//
//  Created by a.reshetnikov on 28/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateAppearanceFor(_ image: UIImage?) {
        self.displayImage(image)
    }

    override func prepareForReuse() {
        myImageView.image = nil
    }

    private func displayImage(_ image: UIImage?) {
        if let _ = image {
            myImageView.image = image
            loadingIndicator.stopAnimating()
            loadingIndicator.isHidden = true
        } else {
            myImageView.image = nil
            loadingIndicator.startAnimating()
            loadingIndicator.isHidden = false
        }
    }

    func fillCell(with model: CellModel) {

    }
}
