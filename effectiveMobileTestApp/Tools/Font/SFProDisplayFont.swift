//
//  SFProDisplayFont.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation
import UIKit

struct SFProDisplayFont {
    enum FontType: String {
        case regular = "SFPRODISPLAYREGULAR"
        case medium = "SFPRODISPLAYMEDIUM"
        case bold = "SFPRODISPLAYBOLD"
    }
    static func font(type: FontType, size: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: size)!
    }
}
