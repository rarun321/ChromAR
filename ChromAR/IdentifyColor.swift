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
    static let NAVY = UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)
    static let BLUE = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
    static let GREEN = UIColor(red: 0, green: 0.5, blue: 0, alpha: 1)
    static let TEAL = UIColor(red: 0, green: 0.5, blue: 0.5, alpha: 1)
    static let AZURE = UIColor(red: 0, green: 0.5, blue: 1, alpha: 1)
    static let LIME = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
    static let SPRING_GREEN = UIColor(red: 0, green: 1, blue: 0.5, alpha: 1)
    static let CYAN = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
    static let MAROON = UIColor(red: 0.5, green: 0, blue: 0, alpha: 1)
    static let PURPLE = UIColor(red: 0.5, green: 0, blue: 0.5, alpha: 1)
    static let VIOLET = UIColor(red: 0.5, green: 0, blue: 1, alpha: 1)
    static let OLIVE = UIColor(red: 0.5, green: 0.5, blue: 0, alpha: 1)
    static let GRAY = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    static let PERIWINKLE = UIColor(red: 0.5, green: 0.5, blue: 1, alpha: 1)
    static let YELLOW_GREEN = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
    static let LIGHT_GREEN = UIColor(red: 0.5, green: 1, blue: 0.5, alpha: 1)
    static let LIGHT_BLUE = UIColor(red: 0.5, green: 1, blue: 1, alpha: 1)
    static let RED = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    static let MAGENTA = UIColor(red: 1, green: 0, blue: 0.5, alpha: 1)
    static let FUSCHIA = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
    static let ORANGE = UIColor(red: 1, green: 0.5, blue: 0, alpha: 1)
    static let SALMON = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 1)
    static let PINK = UIColor(red: 1, green: 0.5, blue: 1, alpha: 1)
    static let YELLOW = UIColor(red: 1, green: 1, blue: 0, alpha: 1)
    static let BRIGHT_YELLOW = UIColor(red: 1, green: 1, blue: 0.5, alpha: 1)
    static let WHITE = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    static func identify (color: UIColor) -> String {
        let black = ("Black", proximity(color: color, other: BLACK))
        let navy = ("Navy", proximity(color: color, other: NAVY))
        let blue = ("Blue", proximity(color: color, other: BLUE))
        let green = ("Green", proximity(color: color, other: GREEN))
        let teal = ("Teal", proximity(color: color, other: TEAL))
        let azure = ("Blue", proximity(color: color, other: AZURE))
        let lime = ("Lime", proximity(color: color, other: LIME))
        let springGreen = ("Green", proximity(color: color, other: SPRING_GREEN))
        let cyan = ("Cyan", proximity(color: color, other: CYAN))
        let maroon = ("Maroon", proximity(color: color, other: MAROON))
        let purple = ("Purple", proximity(color: color, other: PURPLE))
        let violet = ("Violet", proximity(color: color, other: VIOLET))
        let olive = ("Olive", proximity(color: color, other: OLIVE))
        let gray = ("Gray", proximity(color: color, other: GRAY))
        let periwinkle = ("Blue", proximity(color: color, other: PERIWINKLE))
        let yellowGreen = ("Yellow Green", proximity(color: color, other: YELLOW_GREEN))
        let lightGreen = ("Light Green", proximity(color: color, other: LIGHT_GREEN))
        let lightBlue = ("Light Blue", proximity(color: color, other: LIGHT_BLUE))
        let red = ("Red", proximity(color: color, other: RED))
        let magenta = ("Magenta", proximity(color: color, other: MAGENTA))
        let fuschia = ("Fuschia", proximity(color: color, other: FUSCHIA))
        let orange = ("Orange", proximity(color: color, other: ORANGE))
        let salmon = ("Pink", proximity(color: color, other: SALMON))
        let pink = ("Pink", proximity(color: color, other: PINK))
        let yellow = ("Yellow", proximity(color: color, other: YELLOW))
        let brightYellow = ("Yellow", proximity(color: color, other: BRIGHT_YELLOW))
        let white = ("White", proximity(color: color, other: WHITE))
        
        
        let colors = [black, navy, blue, green, teal, azure, lime, springGreen, cyan, maroon, purple, violet, olive, gray, periwinkle, yellowGreen, lightGreen, lightBlue, red, magenta, fuschia, orange, salmon, pink, yellow, brightYellow, white]
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
        let (colorRed, colorGreen, colorBlue, _) = color.components
        let (otherRed, otherGreen, otherBlue, _) = other.components
        
        let red = colorRed - otherRed
        let green = colorGreen - otherGreen
        let blue = colorBlue - otherBlue
        return red * red + green * green + blue * blue
    }
}

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
