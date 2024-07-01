//
//  ApiService.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation
import Resolver

protocol APIServiceProtocol {
    func getMainScreen(completion: @escaping (Result<MainScreenModel, APIError>) -> Void)
    func getSearchScreen(completion: @escaping (Result<SearchScreenModel, APIError>) -> Void)
    func getAllTickets(completion: @escaping (Result<AllTicketsModel, APIError>) -> Void)
}

struct APIService: APIServiceProtocol {
    
    @Injected var worker: NetworkWorkerProtocol
    
    func getMainScreen(completion: @escaping (Result<MainScreenModel, APIError>) -> Void) {
        worker.performRequest(
            queryParametres: nil,
            endpoint: Endpoints.mainScreen.rawValue,
            apiMethod: APIMethods.get,
            responseType: MainScreenModel.self,
            completionHandler: completion
        )
    }
    
    func getSearchScreen(completion: @escaping (Result<SearchScreenModel, APIError>) -> Void) {
        worker.performRequest(
            queryParametres: nil,
            endpoint: Endpoints.search.rawValue,
            apiMethod: APIMethods.get,
            responseType: SearchScreenModel.self,
            completionHandler: completion
        )
    }
    
    func getAllTickets(completion: @escaping (Result<AllTicketsModel, APIError>) -> Void) {
        worker.performRequest(
            queryParametres: nil,
            endpoint: Endpoints.allTickets.rawValue,
            apiMethod: APIMethods.get,
            responseType: AllTicketsModel.self,
            completionHandler: completion
        )
    }
    
}
