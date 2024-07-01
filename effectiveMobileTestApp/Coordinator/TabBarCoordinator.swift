//
//  TabBarCoordinator.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import UIKit

protocol TabBarProtocol: Coordinator {
    
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    func selectedIndex(_ index: Int)
    func currentPage() -> TabBarPage?
}

class TabBarCoordinator: NSObject, TabBarProtocol, Coordinator {
    
    // MARK: - Properties
    
    var tabBarController: UITabBarController = TabBarController()
    weak var navigationController: UINavigationController?
    weak var window: UIWindow?
    
    // MARK: - Init
    
    required init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: Private methods
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: true)
        navController.tabBarItem = UITabBarItem(
            title: page.pageTitleValue(),
            image: page.pageIcon(),
            tag: page.pageOrderNumber()
        )
        
        switch page {
        case .main:
            let coordinator = MainCoordinator(navController)
            coordinator.start()
        case .hotels:
            break
        case .shortly:
            break
        case .subscriptions:
            break
        case .profile:
            break
        }
        return navController
    }
    
    // MARK: - Methods
    
    func start() {
        let pages: [TabBarPage] = [.main, .hotels, .shortly, .subscriptions, .profile]
            .sorted(by: {$0.pageOrderNumber() < $1.pageOrderNumber() })
        
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabBarControllers: controllers)
    }
    
    func prepareTabBarController(withTabBarControllers tabControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.main.pageOrderNumber()
        
        navigationController?.setViewControllers([tabBarController], animated: true)
    }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func selectedIndex(_ index: Int) {
        guard let page = TabBarPage(index: index) else {return}
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func currentPage() -> TabBarPage? {
        TabBarPage(index: tabBarController.selectedIndex)
    }
}
