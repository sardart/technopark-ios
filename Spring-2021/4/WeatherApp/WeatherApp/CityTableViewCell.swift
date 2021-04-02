//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 3/22/21.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let dateUpdatedLabel = UILabel()
    private let iconImageView = UIImageView()
    private let temperatureLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        titleLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        dateUpdatedLabel.textColor = .darkGray
        temperatureLabel.font = .systemFont(ofSize: 48, weight: .medium)
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        [titleLabel, dateUpdatedLabel, iconImageView, temperatureLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.pin
            .bottom(8)
            .left(12)
            .height(40)
            .sizeToFit(.height)
        
        dateUpdatedLabel.pin
            .above(of: titleLabel)
            .left(12)
            .height(20)
            .sizeToFit(.height)
        
        iconImageView.pin
            .size(24)
            .above(of: titleLabel)
            .after(of: dateUpdatedLabel, aligned: .center)
            .marginLeft(8)
        
        temperatureLabel.pin
            .right(12)
            .height(64)
            .sizeToFit(.height)
            .vCenter()
    }

    func configure(with model: City) {
        titleLabel.text = model.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        dateUpdatedLabel.text = dateFormatter.string(from: model.dateUpdated)
        iconImageView.image = UIImage(systemName: model.systemImageName)
        temperatureLabel.text = "\(model.temperature)˚C"
    }
}
