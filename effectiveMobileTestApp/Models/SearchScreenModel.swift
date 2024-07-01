//
//  SearchScreenModel.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation

struct SearchScreenModel: Codable {
    let ticketsOffers: [TicketsOffersModel]
}

struct TicketsOffersModel: Codable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: ValueModel
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case timeRange = "time_range"
        case price
    }
}
