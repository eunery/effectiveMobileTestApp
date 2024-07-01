//
//  MainController.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import UIKit
import SnapKit
import Resolver

class MainController: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: MainCoordinatorProtocol?
    @Injected var viewModel: MainViewModelProtocol
    
    // MARK: - Private properties
    
    private let headerLabel: UILabel = {
        let item = UILabel()
        item.text = "Поиск дешевых \n авиабилетов"
        item.font = .systemFont(ofSize: 22)
        item.numberOfLines = 0
        item.textColor = .white
        item.textAlignment = .center
        return item
    }()
    
    private let searchContainer: UIView = {
        let item = UIView()
        item.backgroundColor = Color.gray3
        item.layer.cornerRadius = 16
        return item
    }()
    
    private let searchView: UIView = {
        let item = UIView()
        item.backgroundColor = Color.gray4
        item.layer.cornerRadius = 16
        return item
    }()
    
    private let searchImage: UIImageView = {
        let image = UIImage(named: "search")
        let item = UIImageView(image: image)
        item.contentMode = .scaleAspectFit
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
    
    private let divider: UIView = {
        let item = UIView()
        item.backgroundColor = Color.gray6
        return item
    }()
    
    private let endButton: UIButton = {
        let item = UIButton()
        item.titleLabel?.font = .systemFont(ofSize: 16)
        item.setTitleColor(Color.gray6, for: .normal)
        item.setTitle("Куда - Турция", for: .normal)
        item.contentHorizontalAlignment = .leading
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    private let offerLabel: UILabel = {
        let item = UILabel()
        item.font = .systemFont(ofSize: 22)
        item.textColor = .white
        item.text = "Музыкально отлететь"
        return item
    }()
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let inset: CGFloat = 16
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 14
        flowLayout.sectionInset = UIEdgeInsets(top: 0,
                                               left: inset * 2,
                                               bottom: 0,
                                               right: inset * 2)
        let item = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        item.showsHorizontalScrollIndicator = false
        return item
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.loadData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupLayout()
        setupCollectionView()
    }
    
    // MARK: - Private methods
    
    private func setupCollectionView() {
        self.collectionView.register(
            OfferCollectionViewCell.self,
            forCellWithReuseIdentifier: OfferCollectionViewCell.reuseIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .none
    }
    
    private func setupUI() {
        view.backgroundColor = Color.black
        startTextField.delegate = self
        
        endButton.addTarget(self, action: #selector(openModal), for: .touchUpInside)
    }
    
    private func setupLayout() {
        view.addSubview(headerLabel)
        view.addSubview(searchContainer)
        searchContainer.addSubview(searchView)
        searchView.addSubview(searchImage)
        searchView.addSubview(startTextField)
        searchView.addSubview(divider)
        searchView.addSubview(endButton)
        
        view.addSubview(offerLabel)
        view.addSubview(collectionView)
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
        
        searchContainer.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(38)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(122)
        }
        
        searchView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        searchImage.snp.makeConstraints { make in
            make.width.height.equalTo(16)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        startTextField.snp.makeConstraints { make in
            make.bottom.equalTo(divider).offset(-8)
            make.leading.equalTo(divider.snp.leading)
            make.trailing.equalTo(divider.snp.trailing)
        }
        
        divider.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalTo(searchImage.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        endButton.snp.makeConstraints { make in
            make.top.equalTo(divider).offset(3)
            make.leading.equalTo(divider.snp.leading)
            make.trailing.equalTo(divider.snp.trailing)
        }
        
        offerLabel.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(52)
            make.leading.equalTo(searchView.snp.leading)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(offerLabel.snp.bottom).offset(26)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(213)
        }
    }
    
    @objc
    private func openModal(){
        let modal = SearchModalViewController()
//        let modal = TicketsViewController()
        self.present(modal, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDelegate

extension MainController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension MainController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.reuseIdentifier, for: indexPath) as? OfferCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configure(model: self.viewModel.offers[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 132, height: 234)
    }
}

extension MainController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
