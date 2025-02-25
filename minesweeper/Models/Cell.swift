struct Cell: Identifiable {
    let id = UUID()
    var isMine = false
    var isRevealed = false
    var isFlagged = false
    var adjacentMines = 0
    var row: Int
    var column: Int
} 