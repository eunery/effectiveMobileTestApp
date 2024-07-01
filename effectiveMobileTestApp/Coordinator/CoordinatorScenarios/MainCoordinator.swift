//
//  MainCoordinator.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation
import UIKit

class MainCoordinatorProtocol {
    
}

class MainCoordinator: MainCoordinatorProtocol, Coordinator {
    var navigationController: UINavigationController?
    var window: UIWindow?
    
    // MARK: - Init
    
    init(_ navVC: UINavigationController?) {
        self.navigationController = navVC
    }
    
    func start() {
        let viewController = MainController()
        viewController.coordinator = self
        navigationController?.setViewControllers([viewController], animated: true)
    }
}
