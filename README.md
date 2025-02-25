# Minesweeper Game Prototype

## Overview

This is a simple prototype of the classic Minesweeper game built using SwiftUI. The game features an 8x8 grid with randomly placed mines, and players can reveal cells, flag potential mines, and win or lose based on their choices.

## Features

- **8x8 Grid**: A standard Minesweeper grid with 10 mines.
- **Cell Interaction**: Tap to reveal cells and long press to flag potential mines.
- **Adjacent Mine Count**: Displays the number of adjacent mines for each revealed cell.
- **Game Over and Win Conditions**: Detects when the player hits a mine or reveals all non-mine cells.
- **New Game Button**: Restart the game at any time.

## 📸 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/204d4be9-5032-48ec-95d8-c50d4afa44fa" width="200" alt="Home Screen">
</p>

## 🎥 Demo

<p align="center">
  <img src="https://github.com/user-attachments/assets/9936fa48-7ffb-4682-acb7-063eeb5d2d74" width="250" alt="App Demo">
</p>
## Requirements

- Xcode 12 or later
- Swift 5.0 or later
- iOS 14.0 or later

## Installation

To install the Minesweeper game prototype, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/kstbyev/minesweeper.git
   ```

2. **Navigate to the project directory**:
   ```bash
   cd minesweeper
   ```

3. **Open the project in Xcode**:
   ```bash
   open minesweeper.xcodeproj
   ```

4. **Build and run the project** on a simulator or a physical device.

## Usage

- **Start the Game**: Launch the app to start playing Minesweeper.
- **Reveal Cells**: Tap on a cell to reveal it. If it contains a mine, the game is over.
- **Flag Cells**: Long press on a cell to flag it as a potential mine.
- **Winning the Game**: Reveal all non-mine cells to win the game.
- **Restarting the Game**: Click the "New Game" button to reset the game state.

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.

## Acknowledgments

- Inspired by the classic Minesweeper game.
- Built with SwiftUI for a modern user interface.
