//
//  ContentView.swift
//  NewsReader
//
//  Created by marco.gomiero on 23.11.23.
//

import SwiftUI
import NewsReaderKMP

struct ContentView: View {
    
    @ObservedObject
    var viewModel: MainViewModel
    
    var body: some View {
        NewsScreen(uiState: viewModel.uiState)
            .task {
                await viewModel.loadNews()
            }
    }
}

struct NewsScreen: View {
    
    var uiState: UiState
    
    var body: some View {
        switch uiState {
        case .loading:
            LoadingView()
        case let .success(newsList):
            NewsList(newsList: newsList)
        case let .error(message):
            ErrorView(reason: message)
        }
    }
}

private struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

private struct ErrorView: View {
    
    let reason: String
    
    var body: some View {
        VStack {
            Spacer()
            Text(self.reason)
            Spacer()
        }
    }
}

private struct NewsCard: View {
    let news: News
    
    @Environment(\.openURL)
    private var openURL
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.news.title)
                .font(.system(size: 18))
            Spacer()
                .frame(height: 9)
            Text(self.news.formattedDate)
                .font(.system(size: 14))
        }
        .onTapGesture {
            if let url = URL(string: news.url) {
                self.openURL(url)
            }
        }
    }
}

private struct NewsList: View {
    
    var newsList: [News]
    
    var body: some View {
        List {
            ForEach(self.newsList, id: \.self) { news in
                NewsCard(news: news)
            }
        }
    }
}

#Preview("Loading") {
    NewsScreen(
        uiState: UiState.loading
    )
}

#Preview("Error") {
    NewsScreen(
        uiState: UiState.error(message: "Something wrong")
    )
}

#Preview("Success") {
    NewsScreen(
        uiState: UiState.success(
            newsList: [
                News(
                    title: "iOS 17",
                    formattedDate: "2021-09-01",
                    url: "https://apple.com"
                ),
                News(
                    title: "iOS 16",
                    formattedDate: "2021-09-01",
                    url: "https://apple.com"
                )
            ]
        )
    )
}
