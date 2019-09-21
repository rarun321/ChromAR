//
//  ColorHarmonies.swift
//  ChromAR
//
//  Created by Dj Jackson on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import Foundation
import UIKit

class ColorHarmonies
{
    //Want to get main color from AR Perspective
    //Then give Different Color Harmonies based off of suggested input
    
    var mainColor: UIColor
    var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
    
    init (mainColor: UIColor)
    {
        self.mainColor = mainColor
        mainColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
    }
    
    func getColor() -> UIColor
    {
        return mainColor
    }
    
    func getTriadic() -> [UIColor]
    {
        let size: Int = 2
        let triColors = Array<UIColor>(repeating:mainColor, count: size)
        
        
        
        
        return triColors
    }
    
    func getAnalogous()
    {
        
    }
    
    func getSplitComplementary()
    {
        
    }
    
}
