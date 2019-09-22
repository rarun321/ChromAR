//
//  IdentifyColor.swift
//  ChromAR
//
//  Created by Tom Hansen on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import Foundation
import UIKit

class IdentifyColor {
    static let BLACK = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    static let WHITE = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let GRAY = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    static let RED = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    static let GREEN = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
    static let BLUE = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
    static let YELLOW = UIColor(red: 1, green: 1, blue: 0, alpha: 1)
    static let CYAN = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
    static let MAGENTA = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
    
    static func identify (color: UIColor) -> String {
        let black = ("Black", proximity(color: color, other: BLACK))
        let white = ("White", proximity(color: color, other: WHITE))
        let gray = ("Gray", proximity(color: color, other: GRAY))
        let red = ("Red", proximity(color: color, other: RED))
        let green = ("Green", proximity(color: color, other: GREEN))
        let blue = ("Blue", proximity(color: color, other: BLUE))
        let yellow = ("Yellow", proximity(color: color, other: YELLOW))
        let cyan = ("Cyan", proximity(color: color, other: CYAN))
        let magenta = ("Magenta", proximity(color: color, other: MAGENTA))
        
        let colors = [black, white, gray, red, green, blue, yellow, cyan, magenta]
        var closest: CGFloat = 4
        var closestName = ""
        
        for (colorName, proximity) in colors {
            if proximity < closest {
                closest = proximity
                closestName = colorName
            }
        }
        
        return closestName
    }
    
    static func proximity (color: UIColor, other: UIColor) -> CGFloat {
        let red = abs(color.ciColor.red - other.ciColor.red)
        let green = abs(color.ciColor.green - other.ciColor.green)
        let blue = abs(color.ciColor.blue - other.ciColor.blue)
        return red + green + blue
    }
}
