//
//  SearchModalViewModel.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 27.06.2024.
//

import Foundation

struct CitySearchModel {
    let image: String
    let town: String
    let description: String
}

protocol SearchModalViewModelProtocol {
    var cities: [CitySearchModel] { get set }
}

final class SearchModalViewModel: SearchModalViewModelProtocol {
    var cities: [CitySearchModel] = [
        CitySearchModel(
            image: "stambul",
            town: "Стамбул",
            description: "Популярное направление"
        ),
        CitySearchModel(
            image: "sochi",
            town: "Сочи",
            description: "Популярное направление"
        ),
        CitySearchModel(
            image: "phuket",
            town: "Пхукет",
            description: "Популярное направление"
        ),
    ]
}
