//
//  Resolver.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { NetworkWorker() }
            .implements(NetworkWorkerProtocol.self)
        register { APIService() }
            .implements(APIServiceProtocol.self)
        register { APIRepository() }
            .implements(APIRepositoryProtocol.self)
        
        register { MainViewModel() as MainViewModelProtocol }
        register { SearchModalViewModel() as SearchModalViewModelProtocol }
        register { TicketsViewModel() as TicketsViewModelProtocol }
    }
}
