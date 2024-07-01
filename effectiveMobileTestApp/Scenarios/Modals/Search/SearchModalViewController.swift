//
//  SearchModalViewController.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 26.06.2024.
//

import Foundation
import UIKit
import SnapKit
import Resolver

class SearchModalViewController: UIViewController {
    
    // MARK: - Properties
    
    @Injected var viewModel: SearchModalViewModelProtocol
    
    // MARK: - Private properties
    
    private let searchView: UIView = {
        let item = UIView()
        item.backgroundColor = Color.gray4
        item.layer.cornerRadius = 16
        return item
    }()
    
    private let divider: UIView = {
        let item = UIView()
        item.backgroundColor = Color.gray4
        return item
    }()
    
    private let planeImage: UIImageView = {
        let image = UIImage(named: "plane")
        let item = UIImageView(image: image)
        return item
    }()
    
    private let startTextField: UITextField = {
        let item = UITextField()
        item.font = .systemFont(ofSize: 16)
        item.textColor = .white
        item.attributedPlaceholder = NSAttributedString(
            string: "Откуда",
            attributes: [NSAttributedString.Key.foregroundColor: Color.gray6]
        )
        return item
    }()
    
    private let searchImage: UIImageView = {
        let image = UIImage(named: "search")
        let item = UIImageView(image: image)
        return item
    }()
    
    private let endTextField: CustomTextField = {
        let item = CustomTextField()
        item.font = .systemFont(ofSize: 16)
        item.textColor = .white
        item.attributedPlaceholder = NSAttributedString(
            string: "Куда - Турция",
            attributes: [NSAttributedString.Key.foregroundColor: Color.gray6]
        )
        item.clearButtonMode = .whileEditing
        return item
    }()
    
    private let optionsStackView: UIStackView = {
        let item = UIStackView()
        item.axis = .horizontal
        item.alignment = .firstBaseline
        item.distribution = .equalCentering
        item.spacing = 6
        item.layoutMargins = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        item.isLayoutMarginsRelativeArrangement = true
        return item
    }()
    
    private let routesView: CustomCardView = CustomCardView(
        image: "route",
        color: #colorLiteral(red: 0.2274509804, green: 0.3882352941, blue: 0.231372549, alpha: 1),
        label: "Сложный \n маршрут"
    )
    private let anywhereView: CustomCardView = CustomCardView(
        image: "globe",
        color: #colorLiteral(red: 0.1333333333, green: 0.3803921569, blue: 0.737254902, alpha: 1),
        label: "Куда угодно"
    )
    private let weekendView: CustomCardView = CustomCardView(
        image: "calendar",
        color: #colorLiteral(red: 0, green: 0.2588235294, blue: 0.4901960784, alpha: 1),
        label: "Выходные"
    )
    private let hotTicketsView: CustomCardView = CustomCardView(
        image: "fire",
        color: #colorLiteral(red: 1, green: 0.368627451, blue: 0.368627451, alpha: 1),
        label: "Горячие \n билеты"
    )
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupLayout()
        setupTableView()
    }
    
    // MARK: - Private methods
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = nil
        tableView.layer.cornerRadius = 16
        tableView.showsVerticalScrollIndicator = false
        tableView.register(PopularCityTableViewCell.self, forCellReuseIdentifier: PopularCityTableViewCell.reuseIdentifier)
    }
    
    private func setupUI() {
        view.backgroundColor = Color.gray1
        searchView.backgroundColor = Color.gray2
        tableView.backgroundColor = Color.gray2
    }
    
    private func setupLayout() {
        view.addSubview(searchView)
        searchView.addSubview(planeImage)
        searchView.addSubview(startTextField)
        searchView.addSubview(divider)
        searchView.addSubview(searchImage)
        searchView.addSubview(endTextField)
        view.addSubview(optionsStackView)
        optionsStackView.addArrangedSubview(routesView)
        optionsStackView.addArrangedSubview(anywhereView)
        optionsStackView.addArrangedSubview(weekendView)
        optionsStackView.addArrangedSubview(hotTicketsView)
        
        view.addSubview(tableView)
        
        searchView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(46)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(116)
        }
        
        divider.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        planeImage.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalTo(startTextField.snp.centerY)
            make.leading.equalTo(divider)
        }
        
        startTextField.snp.makeConstraints { make in
            make.leading.equalTo(planeImage.snp.trailing).offset(8)
            make.trailing.equalTo(divider.snp.trailing)
            make.bottom.equalTo(divider.snp.top).offset(-8)
        }
        
        searchImage.snp.makeConstraints { make in
            make.width.height.equalTo(16)
            make.centerY.equalTo(endTextField.snp.centerY)
            make.leading.equalTo(divider).offset(4)
        }
        
        endTextField.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(10)
            make.leading.equalTo(startTextField.snp.leading)
            make.trailing.equalTo(divider.snp.trailing)
        }
        
        optionsStackView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(26)
            make.leading.equalTo(searchView.snp.leading)
            make.trailing.equalTo(searchView.snp.trailing)
            make.height.equalTo(90)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(optionsStackView.snp.bottom).offset(26)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(226)
        }
    }
}

// MARK: - UITableViewDataSource

extension SearchModalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension SearchModalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularCityTableViewCell.reuseIdentifier, for: indexPath) as? PopularCityTableViewCell else { return UITableViewCell() }
        cell.configure(dataSource: self.viewModel.cities[indexPath.row], isLast: indexPath.row == self.viewModel.cities.count - 1)
        return cell
    }
}
