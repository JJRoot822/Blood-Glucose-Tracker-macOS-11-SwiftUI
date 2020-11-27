//
//  Persistence.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/23/20.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let measurementItem = BGLMeasurement(context: viewContext)
            measurementItem.dateMeasured = Date()
            measurementItem.level = Int16(0)
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            
            print(nsError.localizedDescription)
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Blood_Glucose_Tracker")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print(error.localizedDescription)
            }
        })
    }
}
