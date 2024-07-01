//
//  TicketsViewController.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 28.06.2024.
//

import Foundation
import UIKit
import Resolver

class TicketsViewController: UIViewController {
    
    // MARK: - Properties
    
    @Injected var viewModel: TicketsViewModelProtocol
    
    // MARK: - Private properties
    
    private let backView: UIView = {
        let item = UIView()
        item.backgroundColor = Color.gray2
        return item
    }()
    
    private let backImage: UIImageView = {
        let image = UIImage(named: "leftArrow")
        let item = UIImageView(image: image)
        return item
    }()
    
    private let stackView: UIStackView = {
        let item = UIStackView()
        item.axis = .vertical
        item.spacing = 4
        item.alignment = .leading
        item.distribution = .fillEqually
        return item
    }()
    
    private let townsLabel: UILabel = {
        let item = UILabel()
        item.font = .systemFont(ofSize: 16)
        item.text = "towns"
        item.textColor = .white
        return item
    }()
    
    private let infoLabel: UILabel = {
        let item = UILabel()
        item.textColor = Color.gray6
        item.font = .systemFont(ofSize: 14)
        item.text = "infos"
        return item
    }()
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private let panelView: UIView = {
        let item = UIView()
        item.backgroundColor = Color.blue
        item.layer.cornerRadius = 18
        return item
    }()
    
    private let filterImage: UIImageView = {
        let image = UIImage(named: "filter")
        let item = UIImageView(image: image)
        return item
    }()
    
    private let filterButton: UIButton = {
        let item = UIButton()
        item.setTitle("Фильтр", for: .normal)
        return item
    }()
    
    private let graphicImage: UIImageView = {
        let image = UIImage(named: "graphic")
        let item = UIImageView(image: image)
        return item
    }()
    
    private let graphicButton: UIButton = {
        let item = UIButton()
        item.setTitle("График цен", for: .normal)
        return item
    }()
    
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
        tableView.layer.masksToBounds = true
        tableView.showsVerticalScrollIndicator = false
        tableView.register(TicketTableViewCell.self, forCellReuseIdentifier: TicketTableViewCell.reuseIdentifier)
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        backView.backgroundColor = Color.gray2
        tableView.backgroundColor = .clear
    }
    
    private func setupLayout() {
        view.addSubview(backView)
        backView.addSubview(backImage)
        backView.addSubview(stackView)
        stackView.addArrangedSubview(townsLabel)
        stackView.addArrangedSubview(infoLabel)
        
        view.addSubview(tableView)
        
        view.addSubview(panelView)
        panelView.addSubview(filterImage)
        panelView.addSubview(filterButton)
        panelView.addSubview(graphicImage)
        panelView.addSubview(graphicButton)
        
        
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
        
        backImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
            make.height.equalTo(22)
            make.width.equalTo(24)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(backImage.snp.trailing).offset(13)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
        
        panelView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalTo(226)
            make.height.equalTo(40)
        }
        
        filterImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(18)
        }
        
        filterButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(filterImage.snp.trailing).offset(4)
        }
        
        graphicImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(filterButton.snp.trailing).offset(16)
            make.height.width.equalTo(18)
        }
        
        graphicButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(graphicImage.snp.trailing)
        }
    }
}

// MARK: - UITableViewDelegate

extension TicketsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension TicketsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.tickets.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TicketTableViewCell.reuseIdentifier, for: indexPath) as? TicketTableViewCell else { return UITableViewCell() }
        cell.configre(model: self.viewModel.tickets[indexPath.row])
        return cell
    }
}
