//
//  DateFormatter.swift
//  NewsReader
//
//  Created by marco.gomiero on 23.11.23.
//

import Foundation


class DateFormatterUtil {
    static func getStringTime(timeInMillis: Int64) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        formatter.locale = Locale.current
        return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeInMillis)))
    }
}

