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
        backgroundColor = UIColor.white
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.white
        
        selectionStyle = .none
        
        [titleLabel, dateUpdatedLabel, iconImageView, temperatureLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.pin
            .horizontally(12)
            .vertically(18)
        
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
            .after(of: dateUpdatedLabel)
            .marginLeft(8)
        
        temperatureLabel.pin
            .right(12)
            .height(64)
            .sizeToFit(.height)
            .vCenter()
    }

    func configure(with model: CityViewModel) {
        titleLabel.text = model.title
        dateUpdatedLabel.text = model.dateUpdate
        iconImageView.image = UIImage(systemName: model.systemImageName)
        temperatureLabel.text = "\(model.temperature)˚C"
    }
}
