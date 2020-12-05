//
//  BarChartView.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/26/20.
//

import SwiftUI

struct BarChartView: View {
    var data:       [BGLMeasurement]
    var dateFormat: DateFormatter
    
    @State var barColor: Color = .white
    @State var animate:  Bool  = false
    
    var body: some View {
        VStack(spacing: 20) {
            ColorPicker("Dataset Color", selection: $barColor, supportsOpacity: false)
                .frame(width: 175, height: 25)
            ScrollView(.horizontal) {
                HStack(alignment: .bottom, spacing: 10) {
                    ForEach(data, id: \.id) { measurement in
                        VStack(spacing: 10) {
                            Text("\(measurement.level)")
                                .fontWeight(.black)
                            Capsule(style: .circular)
                                .frame(width: 45, height: CGFloat(Double("\(measurement.level)")! * 1.5))
                                .foregroundColor(barColor)
                            Text("\(measurement.dateMeasured!, formatter: dateFormat)")
                                .fontWeight(.bold)
                        }
                    }
                    
                }
            }
        }
        .padding(.all, 20)
    }
}
