//
//  Coordinator.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController? { get set }
    var window: UIWindow? { get set }
    
    func start()
}
