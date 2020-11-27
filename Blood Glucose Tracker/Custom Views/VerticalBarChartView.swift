//
//  ChartView.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/24/20.
//

import SwiftUI

struct VerticalBarChartView: View {
    var items: FetchedResults<BGLMeasurement>
    var barDateFormatter: DateFormatter
    
    var body: some View {
        HStack(spacing: 40) {
            Text("Minimum Measurement: \(getAllValues().min()!)")
                .fontWeight(.black)
            Text("Maximum Measurement: \(getAllValues().max()!)")
                .fontWeight(.black)
        }
        ScrollView(.horizontal) {
            HStack(alignment: .bottom, spacing: 10) {
                ForEach(items, id: \.id) { item in
                    VStack(spacing: 5) {
                        Text("\(item.level)")
                            .fontWeight(.bold)
                        Rectangle()
                            .frame(width: 45.0, height: CGFloat(Int("\(item.level * 2)")!))
                            .foregroundColor(Color.blue)
                            .cornerRadius(10)
                        Text("\(item.dateMeasured!, formatter: barDateFormatter)")
                            .fontWeight(.black)
                            .frame(width: 75)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                    }
                }
            }
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
