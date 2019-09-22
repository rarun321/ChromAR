//
//  Album.swift
//  ChromAR
//
//  Created by Tom Hansen on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import Foundation

class Album {
    static var album = [Palette]()
    
    static func addPalette () {
        Album.album.append(Palette())
    }
    
    static func removePalette (index: Int) {
        Album.album.remove(at: index);
    }
    
    static func getAlbum () -> [PaletteWrapper] {
        var wrappedPalettes = [PaletteWrapper]()
        for (i, palette) in Album.album.enumerated() {
            wrappedPalettes.append(PaletteWrapper(
                palette: palette,
                index: i
            ))
        }
        return wrappedPalettes
    }
}
