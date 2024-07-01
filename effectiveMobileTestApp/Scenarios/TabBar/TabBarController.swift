//
//  TabBarController.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tabBar.barTintColor = .black
        self.tabBar.isTranslucent = true
        self.tabBar.layer.masksToBounds = true
    }
}
