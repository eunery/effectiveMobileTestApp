//
//  ApiRepository.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation
import Resolver

protocol APIRepositoryProtocol {
    func getMainScreen(
        completionHandler: @escaping (Result<MainScreenModel, APIError>) -> Void)
    func getSearchScreen(
        completionHandler: @escaping (Result<MainScreenModel, APIError>) -> Void)
    func getAllTickets(
        completionHandler: @escaping (Result<MainScreenModel, APIError>) -> Void)
}

class APIRepository: APIRepositoryProtocol {
    
    // MARK: - Properties
    
    @Injected var apiService: APIServiceProtocol
    
    // MARK: - Methods
    
    func getMainScreen(
        completionHandler: @escaping (Result<MainScreenModel, APIError>) -> Void) {
            apiService.getMainScreen { result in
            completionHandler(result)
        }
    }
    
    func getSearchScreen(
        completionHandler: @escaping (Result<MainScreenModel, APIError>) -> Void) {
            apiService.getMainScreen { result in
            completionHandler(result)
        }
    }
    
    func getAllTickets(
        completionHandler: @escaping (Result<MainScreenModel, APIError>) -> Void) {
            apiService.getMainScreen { result in
            completionHandler(result)
        }
    }
}
