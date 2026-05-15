//
//  Date+Formate.swift
//  Chatbox
//
//  Created by admin on 15.05.2026.
//

import Foundation

extension Date {
    var formattedDate: String {
        let formatter = RelativeDateTimeFormatter()

        formatter.unitsStyle = .full

        let text = formatter.localizedString(
            for: self,
            relativeTo: Date()
        )

        return text
    }
}
