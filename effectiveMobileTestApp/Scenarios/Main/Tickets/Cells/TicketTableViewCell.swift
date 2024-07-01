//
//  TicketTableViewCell.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 28.06.2024.
//

import Foundation
import UIKit
import SnapKit

class TicketTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "offerCollectionViewCell"
    
    // MARK: - Private properties
    
    private let promotionView: UIView = {
        let item = UIView()
        item.backgroundColor = Color.blue
        item.layer.masksToBounds = true
        item.layer.cornerRadius = 13
        return item
    }()
    
    private let promotionLabel: UILabel = {
        let item = UILabel()
        item.textColor = .white
        return item
    }()
    
    private let cardContainer: UIView = {
        let item = UIView()
        return item
    }()
    
    private let priceLabel: UILabel = {
        let item = UILabel()
        item.textColor = .white
        return item
    }()
    
    private let companyView: UIView = {
        let item = UIView()
        item.backgroundColor = .red
        item.layer.cornerRadius = 12
        return item
    }()
    
    private let startContainer: UIStackView = {
        let item = UIStackView()
        item.axis = .vertical
        item.alignment = .leading
        item.distribution = .fillEqually
        item.spacing = 4
        return item
    }()
    
    private let startTime: UILabel = {
        let item = UILabel()
        item.textColor = .white
        return item
    }()
    
    private let startAirport: UILabel = {
        let item = UILabel()
        item.textColor = .white
        return item
    }()
    
    private let divider: UILabel = {
        let item = UILabel()
        item.text = "—"
        item.textColor = .white
        return item
    }()
    
    private let endContainer: UIStackView = {
        let item = UIStackView()
        item.axis = .vertical
        item.alignment = .leading
        item.distribution = .fillEqually
        item.spacing = 4
        return item
    }()
    
    private let endTime: UILabel = {
        let item = UILabel()
        item.textColor = .white
        return item
    }()
    
    private let endAirport: UILabel = {
        let item = UILabel()
        item.textColor = .white
        return item
    }()
    
    private let durationLabel: UILabel = {
        let item = UILabel()
        item.textColor = .white
        return item
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    
    // MARK: - Methods
    
    func configre(model: TicketsModel) {
        promotionView.isHidden = !model.isExchangable
        promotionLabel.text = model.badge
        priceLabel.text = model.price.value.description + " ₽"
        startTime.text = model.departure.date
        endTime.text = model.arrival.date
        startAirport.text = model.departure.airport
        endAirport.text = model.arrival.airport
        durationLabel.text = "3.6 часа"
    }

    // MARK: - Private methods
    
    private func setupUI() {
        contentView.backgroundColor = .black
        cardContainer.backgroundColor = Color.gray2
        cardContainer.layer.masksToBounds = true
        cardContainer.layer.cornerRadius = 8
    }
    
    private func setupLayout() {
        contentView.addSubview(promotionView)
        promotionView.addSubview(promotionLabel)
        
        contentView.addSubview(cardContainer)
        contentView.bringSubviewToFront(promotionView)
        cardContainer.addSubview(priceLabel)
        cardContainer.addSubview(companyView)
        
        cardContainer.addSubview(startContainer)
        startContainer.addArrangedSubview(startTime)
        startContainer.addArrangedSubview(startAirport)
        cardContainer.addSubview(divider)
        cardContainer.addSubview(endContainer)
        endContainer.addArrangedSubview(endTime)
        endContainer.addArrangedSubview(endAirport)
        cardContainer.addSubview(durationLabel)
        
        promotionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview()
            make.height.equalTo(26)
        }
        
        promotionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        cardContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(117)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(21)
            make.leading.equalToSuperview().offset(16)
        }
        
        companyView.snp.makeConstraints { make in
            make.centerY.equalTo(startContainer.snp.centerY)
            make.leading.equalTo(priceLabel.snp.leading)
            make.width.height.equalTo(24)
        }
        
        startContainer.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(18)
            make.leading.equalTo(companyView.snp.trailing).offset(8)
            make.bottom.equalToSuperview().inset(16)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(startContainer.snp.top)
            make.leading.equalTo(startContainer.snp.trailing).offset(4)
        }
        
        endContainer.snp.makeConstraints { make in
            make.top.equalTo(startContainer.snp.top)
            make.leading.equalTo(divider.snp.trailing).offset(4)
        }
        
        durationLabel.snp.makeConstraints { make in
            make.top.equalTo(startContainer.snp.top)
            make.leading.equalTo(endContainer.snp.trailing).offset(16)
            make.trailing.lessThanOrEqualToSuperview()
        }
    }
}
