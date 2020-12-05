//
//  ContentView.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/23/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext)
    var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \BGLMeasurement.dateMeasured, ascending: true)], animation: .default)
    var items: FetchedResults<BGLMeasurement>

    @State var level:        String = ""
    @State var dateMeasured: Date   = Date()
    @State var isPresented:  Bool   = false
    @State var selection:    Int    = 0
    @State var barColor:     Color  = .white
    @State var animate:      Bool   = false
    
    var body: some View {
        VStack {
            BloodGlucoseInputsView(level: $level, dateMeasured: $dateMeasured)
            List {
                ForEach(items) { item in
                    MeasurementListItemView(item: item)
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
                .foregroundColor(Color(.controlAccentColor))
                .accessibility(label: Text("Add new Measurement"))
                .disabled(level.isEmpty)
                
                Button(action: { self.isPresented = true }) {
                    Label("Visualize Data", systemImage: "chart.bar.fill")
                }
                .foregroundColor(Color(.controlAccentColor))
                .accessibility(label: Text("Visualize Blood Glucose Measurment Data"))
                .sheet(isPresented: $isPresented) {
                    BarChartView(data: getDataArray(), dateFormat: getBarDateFormatter())
                        .frame(width: 900)
                    
                    Button("Close") {
                        self.isPresented = false
                    }
                    .padding(.all, 10)
                }
            }
        }
    }
}
