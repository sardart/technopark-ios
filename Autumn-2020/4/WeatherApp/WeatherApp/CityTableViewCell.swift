//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 10/19/20.
//

import UIKit

struct CityTableViewCellModel {
    let imageName: String
    let title: String
    let timeString: String
    let temperature: Int
}

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with model: CityTableViewCellModel) {
        iconImageView.image = UIImage(named: model.imageName)
        titleLabel.text = model.title
        timeLabel.text = model.timeString
        temperatureLabel.text = "\(model.temperature)˚"
    }
}
