//
//  CellView.swift
//  minesweeper
//
//  Created by Madi Sharipov on 21.02.2025.
//

import SwiftUI

struct CellView: View {
    let cell: Cell
    let size: CGFloat = 40
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(cell.isRevealed ? Color.gray.opacity(0.3) : Color.gray.opacity(0.8))
                .frame(width: size, height: size)
                .border(Color.black, width: 1)
            
            if cell.isRevealed {
                if cell.isMine {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                } else if cell.adjacentMines > 0 {
                    Text("\(cell.adjacentMines)")
                        .foregroundColor(numberColor(for: cell.adjacentMines))
                }
            } else if cell.isFlagged {
                Image(systemName: "flag.fill")
                    .foregroundColor(.red)
            }
        }
    }
    
    private func numberColor(for count: Int) -> Color {
        switch count {
        case 1: return .blue
        case 2: return .green
        case 3: return .red
        case 4: return .purple
        default: return .black
        }
    }
}