//
//  MainScreenModel.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation

struct MainScreenModel: Codable {
    let offers: [OfferModel]
}

struct OfferModel: Codable {
    let id: Int
    let title: String
    let town: String
    let price: ValueModel
}

struct ValueModel: Codable {
    let value: Int
}
