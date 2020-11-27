//
//  NumberField.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/25/20.
//

import SwiftUI

struct NumberField: View {
    var placeholderText: String
    
    @Binding var level: String
    
    var body: some View {
        TextField(placeholderText, text: $level)
            .frame(width: 150,height: 30)
            .onChange(of: level) { newValue in
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue {
                    level = filtered
                }
            }
    }
}
