//
//  MainViewModel.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation
import Resolver

protocol MainViewModelProtocol {
    var offers: [OfferModel] { get set }
    func loadData(completion: @escaping () -> Void)
}

final class MainViewModel: MainViewModelProtocol {
    
    // MARK: - Properties
    
    var offers: [OfferModel] = []
    
    // MARK: - Private properties
    
    @Injected private var apiRepository: APIRepositoryProtocol
    
    // MARK: - Methods
    
    func loadData(completion: @escaping () -> Void) {
        apiRepository.getMainScreen { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                self.offers = response.offers
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
