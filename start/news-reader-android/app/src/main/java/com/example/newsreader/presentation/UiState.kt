package com.example.newsreader.presentation

import com.example.newsreader.domain.News

internal sealed class UiState {
    data object Loading: UiState()

    data class Success(val newsList: List<News>): UiState()

    data class Error(val message: String): UiState()
}
