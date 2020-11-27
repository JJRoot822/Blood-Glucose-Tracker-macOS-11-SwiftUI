//
//  HorizontalBarChart.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/25/20.
//

import SwiftUI

struct HorizontalBarChartView: View {
    var items: FetchedResults<BGLMeasurement>
    var barDateFormatter: DateFormatter
    
    var body: some View {
        HStack(spacing: 40) {
            Text("Minimum Measurement: \(getAllValues().min()!)")
                .fontWeight(.black)
            Text("Maximum Measurement: \(getAllValues().max()!)")
                .fontWeight(.black)
        }
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(items, id: \.id) { item in
                    HStack(spacing: 5) {
                        Text("\(item.dateMeasured!, formatter: barDateFormatter)")
                            .fontWeight(.black)
                            .frame(width: 75)
                            .padding(.vertical, 10)
                        Rectangle()
                            .frame(width: CGFloat(Float("\(Double(item.level) * 3)")!), height: 35.0)
                            .foregroundColor(Color.blue)
                            .cornerRadius(10)
                        Text("\(item.level)")
                            .fontWeight(.bold)
                    }
                }
            }
            .frame(width: 1200)
        }
        .frame(width: 1200, height: 600)
        .padding(20)
        .background(Color(.windowBackgroundColor))
    }
    
    private func getAllValues() -> [Int] {
        var values: [Int] = []
        
        for item in items {
            values.append(Int("\(item.level)")!)
        }
        
        return values
    }
}
