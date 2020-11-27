//
//  BGLDataUtil+BGLMeasurementsView.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/24/20.
//

import SwiftUI

extension ContentView {
    func getDataArray() -> [BGLMeasurement] {
        var array: [BGLMeasurement] = []
        
        for item in items {
            array.append(item)
        }
        
        return array
    }
    
    func getBarDateFormatter() -> DateFormatter {
        let barDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            
            return formatter
        }()
        
        return barDateFormatter
    }
    
    func addItem() {
        withAnimation {
            let measurement = BGLMeasurement(context: viewContext)
            measurement.dateMeasured = dateMeasured
            measurement.level = Int16(Int(level)!)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                
                print(nsError.localizedDescription)
            }
        }
    }

    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                
                print(nsError.localizedDescription)
            }
        }
    }
}
