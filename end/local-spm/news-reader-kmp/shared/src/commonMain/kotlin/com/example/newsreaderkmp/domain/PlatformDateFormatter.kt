package com.example.newsreaderkmp.domain

expect object DateFormatter {
    fun getStringTime(timeInMillis: Long): String
}