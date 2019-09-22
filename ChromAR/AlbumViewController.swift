//
//  AlbumViewController.swift
//  ChromAR
//
//  Created by Tom Hansen on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import ARKit

class AlbumViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var AlbumView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for (i, palette) in Album.getAlbum().enumerated() {
            let colors = palette.palette.getPalette()
            if colors.count == 0 {
                AlbumView.visibleCells[i].contentView.backgroundColor = UIColor.cyan
            } else {
                AlbumView.visibleCells[i].contentView.backgroundColor = colors[0].color
            }
        }
    }
}
