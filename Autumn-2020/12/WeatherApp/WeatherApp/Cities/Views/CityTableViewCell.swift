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

    private let iconButton = CustomButton()
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
                
        iconButton.addTarget(self, action: #selector(didTapIconButton), for: .touchUpInside)
        
        [iconButton, titleLabel, timeLabel, temperatureLabel].forEach { contentView.addSubview($0) }
    }
    
    @objc
    private func didTapIconButton() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.iconButton.transform = .init(scaleX: 3, y: 3)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.iconButton.transform = .identity
            }
        } completion: { (_) in
            
        }

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
        
        iconButton.pin
            .size(25)
            .above(of: titleLabel)
            .after(of: timeLabel, aligned: .center)
            .marginLeft(8)
        
        temperatureLabel.pin.right(12).height(64).sizeToFit(.height).vCenter()
    }

    func configure(with model: CityTableViewCellModel) {
        iconButton.kf.setImage(with: model.imageURL, for: .normal)
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

final class CustomButton: UIButton {
    private var touchableArea: CGSize = CGSize(width: 44, height: 44)
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let dWidth = touchableArea.width - bounds.size.width
        let dHeight = touchableArea.height - bounds.size.height
        
        let rect = CGRect(x: (bounds.size.width - dWidth) / 2,
                          y: (bounds.size.height - dHeight) / 2,
                          width: touchableArea.width,
                          height: touchableArea.height)
        
        return rect.contains(point)
    }
}
