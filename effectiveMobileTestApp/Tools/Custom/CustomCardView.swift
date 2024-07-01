//
//  CustomCardView.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 27.06.2024.
//

import Foundation
import UIKit

class CustomCardView: UIView {
    
    // MARK: - Private properties
    
    private let imageContainer: UIView = {
        let item = UIView()
        item.layer.cornerRadius = 8
        return item
    }()
    
    private let image: UIImageView = {
        let image = UIImage(named: "")
        let item = UIImageView(image: image)
        item.contentMode = .scaleAspectFit
        return item
    }()
    
    private let label: UILabel = {
        let item = UILabel()
        item.font = .systemFont(ofSize: 14)
        item.textColor = .white
        item.numberOfLines = 0
        item.textAlignment = .center
        return item
    }()
    
    // MARK: - Lifecycle
    
    init(image: String, color: UIColor, label: String) {
        super.init(frame: .zero)
        self.imageContainer.backgroundColor = color
        self.image.image = UIImage(named: image)
        self.label.text = label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        setupLayout()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {}
    
    private func setupLayout() {
        self.addSubview(imageContainer)
        imageContainer.addSubview(image)
        self.addSubview(label)
        
        imageContainer.snp.makeConstraints { make in
            make.height.width.equalTo(48)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.center.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(imageContainer.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
