package com.example.newsreaderkmp.domain

import platform.Foundation.NSDate
import platform.Foundation.NSDateFormatter
import platform.Foundation.NSLocale
import platform.Foundation.currentLocale
import platform.Foundation.dateWithTimeIntervalSince1970

actual object DateFormatter {
    actual fun getStringTime(timeInMillis: Long): String {
        val date = NSDate.dateWithTimeIntervalSince1970((timeInMillis.toDouble() / 1000.0))
        val articleDateFormatter = NSDateFormatter().apply {
            setLocale(NSLocale.currentLocale)
            setDateFormat("d MMM yyyy")
        }
        return articleDateFormatter.stringFromDate(date)
    }
}
