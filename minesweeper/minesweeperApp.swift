//
//  minesweeperApp.swift
//  minesweeper
//
//  Created by Madi Sharipov on 20.02.2025.
//

import SwiftUI

@main
struct minesweeperApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


