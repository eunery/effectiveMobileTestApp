//
//  MockViewController.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation
import UIKit

class MockViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let label: UILabel = {
        let item = UILabel()
        return item
    }()
    
    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    init(label: String) {
        self.label.text = label
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupLayout(){
        view.addSubview(label)
        
        label.snp.makeConstraints { $0.center.equalToSuperview() }
    }
}
