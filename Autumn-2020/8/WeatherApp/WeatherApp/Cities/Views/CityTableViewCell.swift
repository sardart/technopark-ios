//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 10/19/20.
//

import UIKit
import Kingfisher
import PinLayout

struct CityTableViewCellModel {
    let imageURL: URL?
    let title: String
    let timeString: String?
    let temperature: Int?
}

class CityTableViewCell: UITableViewCell {

    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let timeLabel = UILabel()
    private let temperatureLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    private func setup() {
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        temperatureLabel.font = UIFont.systemFont(ofSize: 48, weight: .medium)
        timeLabel.textColor = .darkGray
        backgroundColor = .lightGray
        
        [iconImageView, titleLabel, timeLabel, temperatureLabel].forEach { contentView.addSubview($0) }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.pin
            .bottom(8)
            .left(12)
            .height(40)
            .sizeToFit(.height)
        
        timeLabel.pin
            .above(of: titleLabel)
            .left(12)
            .height(20)
            .sizeToFit(.height)
        
        iconImageView.pin
            .size(25)
            .above(of: titleLabel)
            .after(of: timeLabel, aligned: .center)
            .marginLeft(8)
        
        temperatureLabel.pin.right(12).height(64).sizeToFit(.height).vCenter()
    }

    func configure(with model: CityTableViewCellModel) {
        iconImageView.kf.setImage(with: model.imageURL)
        titleLabel.text = model.title
        timeLabel.text = model.timeString
        
        if let temperature = model.temperature {
            temperatureLabel.text = "\(temperature)˚C"
        } else {
            temperatureLabel.text = nil
        }
        
        setNeedsLayout()
    }
}
