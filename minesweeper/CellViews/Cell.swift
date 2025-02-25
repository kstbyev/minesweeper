//
//  Cell.swift
//  minesweeper
//
//  Created by Madi Sharipov on 21.02.2025.
//

import Foundation

struct Cell: Identifiable {
    let id = UUID()
    var isMine = false
    var isRevealed = false
    var isFlagged = false
    var adjacentMines = 0
    var row: Int
    var column: Int
}
