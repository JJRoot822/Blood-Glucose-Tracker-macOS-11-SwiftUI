//
//  BGLDataUtil+MeasurementListItemView.swift
//  Blood Glucose Tracker
//
//  Created by Josh Root on 11/25/20.
//

import Foundation
import SwiftUI

extension MeasurementListItemView {
    func getItemDateFormatter() -> DateFormatter {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            
            formatter.dateStyle = .full
            formatter.timeStyle = .short
            
            return formatter
        }()
        
        return dateFormatter
    }
    
    func getIconColor(level: Int16, min: Int, max: Int) -> Color {
        if (level >= min && level <= max) {
            return .green
        } else if ((level < min && level >= min - 10) || (level > max && level <= max + 10)) {
            return .yellow
        } else if ((level < min - 10 && level >= min - 20) || (level > max + 10 && level <= max + 20)) {
            return .orange
        } else if (level < min - 20 || level > max + 20) {
            return .red
        } else {
            return Color(.labelColor)
        }
    }
}
