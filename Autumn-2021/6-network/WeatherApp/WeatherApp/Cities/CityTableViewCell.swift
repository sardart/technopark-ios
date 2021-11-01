//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 29.10.2021.
//

import Foundation
import UIKit
import PinLayout
import Kingfisher


final class CityTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let tempLabel = UILabel()
    private let iconImageView = UIImageView()
    private let timeLabel = UILabel()
    
    private let containerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        selectionStyle = .none
        
        titleLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        timeLabel.textColor = .darkGray
        tempLabel.font = .systemFont(ofSize: 48, weight: .medium)
        iconImageView.image = UIImage(systemName: "pencil")
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 0.5
        containerView.layer.shadowOffset = .init(width: 0.5, height: 0.5)
        containerView.layer.shadowOpacity = 0.8
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = .white
        
        
        [titleLabel, tempLabel, iconImageView, timeLabel].forEach {
            containerView.addSubview($0)
        }
        
        contentView.addSubview(containerView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.pin
            .horizontally(12)
            .vertically(16)
        
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
            .size(24)
            .above(of: titleLabel)
            .after(of: timeLabel)
            .marginLeft(8)
        
        tempLabel.pin
            .right(12)
            .height(64)
            .sizeToFit(.height)
            .vCenter()
    }
    
    func configure(with viewModel: CityViewModel) {
        titleLabel.text = viewModel.title
        timeLabel.text = viewModel.time
        tempLabel.text = viewModel.temp
        iconImageView.kf.setImage(with: viewModel.icon)
    }
}
