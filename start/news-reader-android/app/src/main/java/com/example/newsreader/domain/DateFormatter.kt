package com.example.newsreader.domain

import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

internal object DateFormatter {
    fun getStringTime(timeInMillis: Long): String {
        val formatter = SimpleDateFormat("d MMM yyyy", Locale.getDefault())
        return formatter.format(Date(timeInMillis * 1000))
    }
}