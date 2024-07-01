//
//  TicketsViewModel.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 28.06.2024.
//

import Foundation

protocol TicketsViewModelProtocol {
    var tickets: [TicketsModel] { get set }
}

final class TicketsViewModel: TicketsViewModelProtocol {

    // MARK: - Properties
    
    var tickets: [TicketsModel] = [
        TicketsModel(id: 1,
                     badge: "badge",
                     price: ValueModel(value: 5000),
                     providerName: "providerName",
                     company: "Company",
                     departure: FlightDescription(town: "Town", date: "date", airport: "VKO"),
                     arrival: FlightDescription(town: "Town", date: "date", airport: "WWW"),
                     hasTransfer: true,
                     hasVisaTransfer: true,
                     luggage: LuggageModel(hasLuggage: true, price: ValueModel(value: 123)),
                     handLuggage: HandLuggageModel(hasHandLuggage: true, size: "123"),
                     isReturnable: true,
                     isExchangable: true
                    ),
        TicketsModel(id: 1,
                     badge: "badge",
                     price: ValueModel(value: 5000),
                     providerName: "providerName",
                     company: "Company",
                     departure: FlightDescription(town: "Town", date: "date", airport: "VKO"),
                     arrival: FlightDescription(town: "Town", date: "date", airport: "WWW"),
                     hasTransfer: true,
                     hasVisaTransfer: true,
                     luggage: LuggageModel(hasLuggage: true, price: ValueModel(value: 123)),
                     handLuggage: HandLuggageModel(hasHandLuggage: true, size: "123"),
                     isReturnable: true,
                     isExchangable: true
                    ),
        TicketsModel(id: 1,
                     badge: "badge",
                     price: ValueModel(value: 5000),
                     providerName: "providerName",
                     company: "Company",
                     departure: FlightDescription(town: "Town", date: "date", airport: "VKO"),
                     arrival: FlightDescription(town: "Town", date: "date", airport: "WWW"),
                     hasTransfer: true,
                     hasVisaTransfer: true,
                     luggage: LuggageModel(hasLuggage: true, price: ValueModel(value: 123)),
                     handLuggage: HandLuggageModel(hasHandLuggage: true, size: "123"),
                     isReturnable: true,
                     isExchangable: true
                    ),
        TicketsModel(id: 1,
                     badge: "badge",
                     price: ValueModel(value: 5000),
                     providerName: "providerName",
                     company: "Company",
                     departure: FlightDescription(town: "Town", date: "date", airport: "VKO"),
                     arrival: FlightDescription(town: "Town", date: "date", airport: "WWW"),
                     hasTransfer: true,
                     hasVisaTransfer: true,
                     luggage: LuggageModel(hasLuggage: true, price: ValueModel(value: 123)),
                     handLuggage: HandLuggageModel(hasHandLuggage: true, size: "123"),
                     isReturnable: true,
                     isExchangable: true
                    )
    ]
}
