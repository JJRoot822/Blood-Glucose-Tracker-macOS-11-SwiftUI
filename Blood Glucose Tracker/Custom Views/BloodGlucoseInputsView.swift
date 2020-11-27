//
//  BloodGlucoseInputsView.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/25/20.
//

import SwiftUI

struct BloodGlucoseInputsView: View {
    @Binding var level: String
    @Binding var dateMeasured: Date
    
    var body: some View {
        HStack(spacing: 20) {
            NumberField(placeholderText: "Blood Sugar Level", level: $level)
            DatePicker("", selection: $dateMeasured)
                .frame(width: 175, height: 30)
            Spacer()
        }
        .padding(10)
    }
}
