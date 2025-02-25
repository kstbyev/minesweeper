class Game: ObservableObject {
    @Published var grid: [[Cell]] = []
    @Published var gameOver = false
    @Published var gameWon = false
    
    let rows: Int
    let columns: Int
    let mineCount: Int
    
    init(rows: Int = 8, columns: Int = 8, mineCount: Int = 10) {
        self.rows = rows
        self.columns = columns
        self.mineCount = mineCount
        setupGame()
    }
    
    func setupGame() {
        // Initialize empty grid
        grid = Array(repeating: Array(repeating: Cell(row: 0, column: 0), count: columns), count: rows)
        
        // Set proper coordinates
        for row in 0..<rows {
            for column in 0..<columns {
                grid[row][column] = Cell(row: row, column: column)
            }
        }
        
        // Place mines randomly
        var minesPlaced = 0
        while minesPlaced < mineCount {
            let row = Int.random(in: 0..<rows)
            let column = Int.random(in: 0..<columns)
            
            if !grid[row][column].isMine {
                grid[row][column].isMine = true
                minesPlaced += 1
            }
        }
        
        calculateAdjacentMines()
    }
    
    private func calculateAdjacentMines() {
        for row in 0..<rows {
            for column in 0..<columns {
                if !grid[row][column].isMine {
                    grid[row][column].adjacentMines = countAdjacentMines(row: row, column: column)
                }
            }
        }
    }
    
    private func countAdjacentMines(row: Int, column: Int) -> Int {
        var count = 0
        for i in -1...1 {
            for j in -1...1 {
                let newRow = row + i
                let newColumn = column + j
                if newRow >= 0 && newRow < rows && newColumn >= 0 && newColumn < columns {
                    if grid[newRow][newColumn].isMine {
                        count += 1
                    }
                }
            }
        }
        return count
    }
    
    func revealCell(at row: Int, column: Int) {
        guard !grid[row][column].isRevealed && !grid[row][column].isFlagged else { return }
        
        grid[row][column].isRevealed = true
        
        if grid[row][column].isMine {
            gameOver = true
            revealAllMines()
            return
        }
        
        if grid[row][column].adjacentMines == 0 {
            revealAdjacentCells(row: row, column: column)
        }
        
        checkWinCondition()
    }
    
    func toggleFlag(at row: Int, column: Int) {
        guard !grid[row][column].isRevealed else { return }
        grid[row][column].isFlagged.toggle()
    }
    
    private func revealAllMines() {
        for row in 0..<rows {
            for column in 0..<columns {
                if grid[row][column].isMine {
                    grid[row][column].isRevealed = true
                }
            }
        }
    }
    
    private func revealAdjacentCells(row: Int, column: Int) {
        for i in -1...1 {
            for j in -1...1 {
                let newRow = row + i
                let newColumn = column + j
                if newRow >= 0 && newRow < rows && newColumn >= 0 && newColumn < columns {
                    if !grid[newRow][newColumn].isRevealed && !grid[newRow][newColumn].isMine {
                        revealCell(at: newRow, column: newColumn)
                    }
                }
            }
        }
    }
    
    private func checkWinCondition() {
        let allNonMinesRevealed = grid.allSatisfy { row in
            row.allSatisfy { cell in
                cell.isMine || cell.isRevealed
            }
        }
        if allNonMinesRevealed {
            gameWon = true
        }
    }
} 