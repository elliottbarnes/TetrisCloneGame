//
//  Block.swift
//  Swiftris2
//
//  Created by Elliott Barnes on 2020-05-30.
//  Copyright © 2020 Barnes. All rights reserved.
//

import Foundation
import SpriteKit

let NumberOfColors: UInt32 = 6

enum BlockColor: Int, CustomStringConvertible {
    
    case Blue = 0, Orange, Purple, Teal, Red, Yellow
    
    var spriteName: String {
        switch self {
        case .Blue:
            return "Blue"
        case .Orange:
            return "Orange"
        case .Purple:
            return "Purple"
        case .Red:
            return "Red"
        case .Teal:
            return "Teal"
        case .Yellow:
            return "Yellow"
        }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor{
        return BlockColor(rawValue: Int(arc4random_uniform(NumberOfColors)))!
    }
    
}

class Block: Hashable, CustomStringConvertible {
    
    // initialize constants
    let color: BlockColor
    
    // declare properties
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    
    var spriteName: String {
        return color.spriteName
    }
    
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column) , \(row)]"
    }
    
    init(column: Int, row: Int, color: BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}
