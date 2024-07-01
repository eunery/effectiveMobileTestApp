//
//  AppCoordinator.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    
}

class AppCoordinator: Coordinator, AppCoordinatorProtocol {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController?
    var window: UIWindow?
    
    // MARK: - Init
    
    required init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Methods
    
    func start() {
        showTabBar()
    }
    
    func showTabBar() {
        let coordinator = TabBarCoordinator(navigationController)
        coordinator.window = window
        coordinator.start()
    }
}
