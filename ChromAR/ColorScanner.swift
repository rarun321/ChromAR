//
//  ColorScanner.swift
//  ChromAR
//
//  Created by Rithvik Arun on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit
import ARKit

//ColorScanner is the rectangle in the middle of the application that detects color
class ColorScanner{
    
    let rectanglePositionX : CGFloat
    let rectanglePositionY : CGFloat
    let rectangleWidth : CGFloat
    let rectangleHeight : CGFloat
    
    init(rectanglePositionX : CGFloat, rectanglePositionY: CGFloat, rectangleWidth : CGFloat, rectangleHeight : CGFloat ) {
        self.rectanglePositionX = rectanglePositionX
        self.rectanglePositionY = rectanglePositionY
        self.rectangleWidth = rectangleWidth
        self.rectangleHeight = rectangleHeight
    }
    
    //Creates CGRectangle For Scanning Color
    func CreateColorScanner() -> UIView{
        let colorScanner = CGRect(x: rectanglePositionX, y: rectanglePositionY, width: rectangleWidth, height: rectangleHeight)
        let colorScannerView = UIView(frame: colorScanner)
        colorScannerView.backgroundColor = UIColor.clear
        return colorScannerView
    }
    
    //Takes A Snapshot Of Whats Within The ColorScanner
      func SnapShotOfColorScanner(view: UIView) -> UIImage{
          UIGraphicsBeginImageContextWithOptions(CGSize(width: rectangleWidth, height: rectangleHeight), false, 0)
          view.drawHierarchy(in: CGRect(x: -(rectanglePositionX), y: -(rectanglePositionY), width: view.bounds.size.width, height: view.bounds.size.height), afterScreenUpdates: false)
          let croppedShot : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
          return croppedShot;
      }
    
    //Adds SnapShot Taken From UI To The AR Node
    func AddSnapShotToNode(image : UIImage, node: SCNNode){
        let materials = SCNMaterial()
        materials.diffuse.contents = image
        node.geometry?.materials = [materials]
    }
    
    func Process(image : UIImage){
       image.GetRGBValues()
    }
}


extension UIImage {
    func GetRGBValues(){
        let result = NSMutableArray()

        var hugeIntegerRed : Int64 = 0
        var hugeIntegerGreen : Int64 = 0
        var hugeIntegerBlue : Int64 = 0
        
        let img = self.cgImage!
        let width = img.width
        let height = img.height
        let colorSpace = CGColorSpaceCreateDeviceRGB()

        var rawData = [UInt8](repeating: 0, count: width*height*4)
        let bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * width
        let bytesPerComponent = 8

        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue
        let context = CGContext(data: &rawData, width: width, height: height, bitsPerComponent: bytesPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo)
        let rect = CGRect(origin: .zero, size: CGSize(width: width, height: height))
        context?.draw(cgImage!, in: rect)
        for x in 0..<width {
            for y in 0..<height {
                let byteIndex = (bytesPerRow * x) + y * bytesPerPixel

                hugeIntegerRed +=  Int64(rawData[byteIndex])
                hugeIntegerGreen +=  Int64(rawData[byteIndex + 1])
                hugeIntegerBlue +=  Int64(rawData[byteIndex + 2])
            }
        }
        
        hugeIntegerRed = hugeIntegerRed / Int64((width * height))
        hugeIntegerGreen = hugeIntegerGreen / Int64((width * height))
        hugeIntegerBlue = hugeIntegerBlue / Int64((width * height))
        
        let color = UIColor(red: CGFloat(hugeIntegerRed) / 255, green: CGFloat(hugeIntegerGreen) / 255, blue: CGFloat(hugeIntegerBlue) / 255, alpha: 1)
    }
}

