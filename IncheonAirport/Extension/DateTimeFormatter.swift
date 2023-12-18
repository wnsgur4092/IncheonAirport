//
//  DateTimeFormatter.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 18/12/2023.
//

import Foundation

struct DateTimeFormatter {
    static func formatTime(_ timeString: String?) -> String {
        guard let timeString = timeString, timeString.count == 4 else {
            return "Invalid Time"
        }

        let index = timeString.index(timeString.startIndex, offsetBy: 2)
        let formattedTime = timeString[..<index] + ":" + timeString[index...]
        return String(formattedTime)
    }
}
