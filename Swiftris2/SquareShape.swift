//
//  SquareShape.swift
//  Swiftris2
//
//  Created by Elliott Barnes on 2020-05-30.
//  Copyright © 2020 Barnes. All rights reserved.
//

import Foundation

/*
         | 0•| 1 |
         | 2 | 3 |

     • marks the row/column indicator for the shape

 */

// square shape doesn't rotate
     

class SquareShape: Shape {
    
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.Zero: [(0, 0), (1, 0), (0, 1), (1, 1)],
            Orientation.OneEighty: [(0, 0), (1, 0), (0, 1), (1, 1)],
            Orientation.Ninety: [(0, 0), (1, 0), (0, 1), (1, 1)],
            Orientation.TwoSeventy: [(0, 0), (1, 0), (0, 1), (1, 1)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
            return [
                Orientation.Zero:       [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
                Orientation.OneEighty:  [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
                Orientation.Ninety:     [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
                Orientation.TwoSeventy: [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]]
            ]
        }
}
