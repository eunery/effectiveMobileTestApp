//
//  TabBarPage.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import UIKit

enum TabBarPage {
    case main, hotels, shortly, subscriptions, profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .main
        case 1:
            self = .hotels
        case 2:
            self = .shortly
        case 3:
            self = .subscriptions
        case 4:
            self = .profile
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .main:
            return "Авиабилеты"
        case .hotels:
            return "Отели"
        case .shortly:
            return "Короче"
        case .subscriptions:
            return "Подписки"
        case .profile:
            return "Профиль"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .hotels:
            return 1
        case .shortly:
            return 2
        case .subscriptions:
            return 3
        case .profile:
            return 4
        }
    }
    
    func pageIcon() -> UIImage? {
        switch self {
        case .main:
            return UIImage(named: "main")
        case .hotels:
            return UIImage(named: "hotels")
        case .shortly:
            return UIImage(named: "shortly")
        case .subscriptions:
            return UIImage(named: "subscriptions")
        case .profile:
            return UIImage(named: "profile")
        }
    }
}
