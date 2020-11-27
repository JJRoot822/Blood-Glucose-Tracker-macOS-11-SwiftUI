//
//  MeasurementListItemView.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/25/20.
//

import SwiftUI

struct MeasurementListItemView: View {
    var item: BGLMeasurement
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(getIconColor(level: item.level, min: 70, max: 130))
            Spacer()
            Text("Blood Glucose Level: \(item.level)mg/dL")
                .multilineTextAlignment(.trailing)
                .frame(width: 250)
            Spacer()
            Text("\(item.dateMeasured!, formatter: getItemDateFormatter())")
                .frame(width: 450)
                .multilineTextAlignment(.leading)
        }
        .padding(.all, 5)
    }
}
