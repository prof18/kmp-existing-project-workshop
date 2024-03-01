//
//  MainViewModel.swift
//  NewsReader
//
//  Created by marco.gomiero on 23.11.23.
//

import Foundation

@MainActor
class MainViewModel: ObservableObject {
    
    @Published
    var uiState: UiState = UiState.loading
    
    private var newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    func loadNews() async {
        do {
            let newsList = try await newsRepository.fetchNews()
            uiState = UiState.success(newsList: newsList)
        } catch {
            print(error)
            uiState = UiState.error(message: error.localizedDescription)
        }
    }
}
