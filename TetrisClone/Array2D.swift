//
//  Array2D.swift
//  Swiftris2
//
//  Created by Elliott Barnes on 2020-05-30.
//  Copyright © 2020 Barnes. All rights reserved.
//

import Foundation

class Array2D<T> {
    let columns: Int
    let rows: Int
    
    var arr: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        arr = Array<T?>(repeating: nil, count: columns*rows)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return arr[(row*columns)+column]
        }
        set(newValue) {
            arr[(row*columns) + column] = newValue
        }
    }
    
    
    
}
