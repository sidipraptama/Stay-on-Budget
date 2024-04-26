//
//  Stay_on_BudgetApp.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 26/04/24.
//

import SwiftUI
import SwiftData

@main
struct Stay_on_BudgetApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var game = Game()
    @State private var networkMonitor = NetworkMonitor()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([HighScoreModel.self])
        
        do {
            return try ModelContainer(for: schema)
        }
        catch {
            fatalError("Could not create ModelContainer; \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(networkMonitor)
                .environment(game)
                .modelContainer(sharedModelContainer)
        }
    }
}
