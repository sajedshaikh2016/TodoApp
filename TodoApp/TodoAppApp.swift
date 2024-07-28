//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Sajed Shaikh on 28/07/24.
//

import SwiftUI

@main
struct TodoAppApp: App {
    
    let persistenceContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.viewContext)
        }
    }
}
