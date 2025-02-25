//
//  ContentView.swift
//  minesweeper
//
//  Created by Madi Sharipov on 20.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var game = Game()
    
    var body: some View {
        VStack {
            Text(game.gameOver ? "Game Over!" : (game.gameWon ? "You Won!" : "Minesweeper"))
                .font(.title)
                .padding()
            
            VStack(spacing: 0) {
                ForEach(0..<game.rows, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<game.columns, id: \.self) { column in
                            Button(action: {
                                if !game.gameOver && !game.gameWon {
                                    game.revealCell(at: row, column: column)
                                }
                            }) {
                                CellView(cell: game.grid[row][column])
                            }
                            .simultaneousGesture(
                                LongPressGesture(minimumDuration: 0.5)
                                    .onEnded { _ in
                                        if !game.gameOver && !game.gameWon {
                                            game.toggleFlag(at: row, column: column)
                                        }
                                    }
                            )
                        }
                    }
                }
            }
            
            Button("New Game") {
                game.setupGame()
                game.gameOver = false
                game.gameWon = false
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
