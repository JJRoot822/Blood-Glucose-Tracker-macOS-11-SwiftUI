//
//  Blood_Glucose_TrackerApp.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/23/20.
//

import SwiftUI

@main
struct Blood_Glucose_TrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
