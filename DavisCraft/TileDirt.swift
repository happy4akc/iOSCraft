//
//  TileDirt.swift
//  DavisCraft
//
//  Created by Michael Figueroa on 11/5/15.
//  Copyright © 2015 UCDClassNitta. All rights reserved.
//

import Foundation
import SpriteKit

class TileDirt: Tile{
    
    init(location: CGPoint) {
        super.init(texture: nil, color: SKColor.clearColor(), size: CGSize.zero)
        self.position = location
        self.name = "grass"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}