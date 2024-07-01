//
//  CustomTextField.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 27.06.2024.
//

import Foundation
import UIKit

class CustomTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()

        for view in subviews {
            if let button = view as? UIButton {
                button.setImage(button.image(for: .normal)?.withRenderingMode(.alwaysTemplate), for: .normal)
                button.tintColor = .white
            }
        }
    }
}
