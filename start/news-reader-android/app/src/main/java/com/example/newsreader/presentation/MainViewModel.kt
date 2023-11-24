package com.example.newsreader.presentation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.newsreader.domain.News
import com.example.newsreader.domain.NewsRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch

internal class MainViewModel(
    private val newsRepository: NewsRepository = NewsRepository()
) : ViewModel() {

    private val mutableUiState = MutableStateFlow<UiState>(UiState.Loading)
    val uiState: StateFlow<UiState> = mutableUiState.asStateFlow()

    init {
        viewModelScope.launch {
            try {
                val newsList = newsRepository.fetchNews()
                mutableUiState.update {
                    UiState.Success(newsList)
                }
            } catch (e: Exception) {
                mutableUiState.update {
                    UiState.Error(message = "Something went wrong")
                }
            }
        }
    }
}