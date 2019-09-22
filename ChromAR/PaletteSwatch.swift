//
//  PaletteSwatch.swift
//  ChromAR
//
//  Created by Tom Hansen on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class PaletteSwatch {
    
    let rectanglePositionX : CGFloat
    let rectanglePositionY : CGFloat
    let rectangleWidth : CGFloat
    let rectangleHeight : CGFloat
    let color1 : UIColor
    let color2 : UIColor
    let color3 : UIColor
    let color4 : UIColor
    
    init (rectanglePositionX : CGFloat, rectanglePositionY: CGFloat, rectangleWidth: CGFloat, rectangleHeight : CGFloat, palette: PaletteWrapper ) {
        self.rectanglePositionX = rectanglePositionX
        self.rectanglePositionY = rectanglePositionY
        self.rectangleWidth = rectangleWidth
        self.rectangleHeight = rectangleHeight
        self.color1 = UIColor.clear;
        self.color2 = UIColor.clear;
        self.color3 = UIColor.clear;
        self.color4 = UIColor.clear;
    }
}
