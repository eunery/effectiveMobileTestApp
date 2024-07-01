//
//  OfferCollectionViewCell.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation
import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "offerCollectionViewCell"
    
    // MARK: - Private properties
    
    private let image: UIImageView = {
        let image = UIImage(named: "")
        let item = UIImageView(image: image)
        item.layer.masksToBounds = true
        item.layer.cornerRadius = 16
        return item
    }()
    
    private let titleLabel: UILabel = {
        let item = UILabel()
        item.textColor = .white
        item.font = .systemFont(ofSize: 16)
        return item
    }()
    
    private let townLabel: UILabel = {
        let item = UILabel()
        item.textColor = .white
        item.font = .systemFont(ofSize: 14)
        return item
    }()
    
    private let horizontalStackView: UIStackView = {
        let item = UIStackView()
        item.axis = .horizontal
        item.alignment = .center
        item.spacing = 6
        item.layoutMargins = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        item.isLayoutMarginsRelativeArrangement = true
        return item
    }()
    
    private let planeImage: UIImageView = {
        let image = UIImage(named: "plane")
        let item = UIImageView(image: image)
        return item
    }()
    
    private let priceLabel: UILabel = {
        let item = UILabel()
        item.textColor = .white
        item.font = .systemFont(ofSize: 14)
        return item
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configure(model: OfferModel) {
        image.image = UIImage(named: model.id.description)
        titleLabel.text = model.title
        townLabel.text = model.town
        priceLabel.text = "от \(model.price.value) ₽"
    }
    
    // MARK: - Private methods
    
    private func setupUI() {}
    
    private func setupLayout() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(townLabel)
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(planeImage)
        horizontalStackView.addArrangedSubview(priceLabel)
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.height.equalTo(133)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        townLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(townLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        planeImage.snp.makeConstraints { $0.height.width.equalTo(34) }
    }
}
