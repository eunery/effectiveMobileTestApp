//
//  AllTicketsModel.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation

struct AllTicketsModel: Codable {
    let tickets: TicketsModel
}

struct TicketsModel: Codable {
    let id: Int
    let badge: String
    let price: ValueModel
    let providerName: String
    let company: String
    let departure: FlightDescription
    let arrival: FlightDescription
    let hasTransfer: Bool
    let hasVisaTransfer: Bool
    let luggage: LuggageModel
    let handLuggage: HandLuggageModel
    let isReturnable: Bool
    let isExchangable: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case badge
        case price
        case providerName = "provider_name"
        case company
        case departure
        case arrival
        case hasTransfer = "has_transfer"
        case hasVisaTransfer = "has_visa_transfer"
        case luggage
        case handLuggage = "hand_luggage"
        case isReturnable = "is_returnable"
        case isExchangable = "is_exchangable"
    }
}

struct FlightDescription: Codable {
    let town: String
    let date: String
    let airport: String
}

struct LuggageModel: Codable {
    let hasLuggage: Bool
    let price: ValueModel
    
    enum CodingKeys: String, CodingKey {
        case hasLuggage = "has_luggage"
        case price
    }
}

struct HandLuggageModel: Codable {
    let hasHandLuggage: Bool
    let size: String
    
    enum CodingKeys: String, CodingKey {
        case hasHandLuggage = "has_hand_luggage"
        case size
    }
}
