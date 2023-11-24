package com.example.newsreaderkmp.domain

internal expect object DateFormatter {
    fun getStringTime(timeInMillis: Long): String
}