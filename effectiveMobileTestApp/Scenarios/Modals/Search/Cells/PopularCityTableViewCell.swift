//
//  PopularCityTableViewCell.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 27.06.2024.
//

import Foundation
import UIKit

class PopularCityTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "popularCityTableViewCell"
    
    // MARK: - Private properties
    
    private let image: UIImageView = {
        let image = UIImage(named: "")
        let item = UIImageView(image: image)
        item.layer.masksToBounds = true
        item.layer.cornerRadius = 8
        return item
    }()
    
    private let stackView: UIStackView = {
        let item = UIStackView()
        item.axis = .vertical
        item.distribution = .fillEqually
        item.spacing = 6
        item.layoutMargins = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        item.isLayoutMarginsRelativeArrangement = true
        return item
    }()
    
    private let townNameLabel: UILabel = {
        let item = UILabel()
        item.font = .systemFont(ofSize: 16)
        item.textColor = .white
        item.numberOfLines = 0
        item.textAlignment = .left
        return item
    }()
    
    private let descriptionLabel: UILabel = {
        let item = UILabel()
        item.font = .systemFont(ofSize: 14)
        item.textColor = Color.gray5
        item.numberOfLines = 0
        item.textAlignment = .left
        item.text = "Популярное направление"
        return item
    }()
    
    private let divider: UIView = {
        let item = UIView()
        item.backgroundColor = Color.gray4
        return item
    }()

    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configure(dataSource: CitySearchModel, isLast: Bool) {
        image.image = UIImage(named: dataSource.image)
        townNameLabel.text = dataSource.town
        descriptionLabel.text = dataSource.description
        divider.isHidden = isLast
        if isLast {
            divider.snp.updateConstraints { make in
                make.top.equalTo(image.snp.bottom).offset(0)
                make.height.equalTo(0)
                make.bottom.equalToSuperview().offset(0)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        contentView.backgroundColor = Color.gray3
    }
    
    private func setupLayout() {
        contentView.addSubview(image)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(townNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        contentView.addSubview(divider)
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(40)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(image.snp.top)
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(image.snp.bottom)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(8)
            make.leading.equalTo(image.snp.leading)
            make.trailing.equalTo(stackView.snp.trailing)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(1)
        }
    }
}
