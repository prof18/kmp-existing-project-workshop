//
//  NewsReaderApp.swift
//  NewsReader
//
//  Created by marco.gomiero on 23.11.23.
//

import SwiftUI
import NewsReaderKMP

@main
struct NewsReaderApp: App {
    
    @StateObject
    private var mainViewModel: MainViewModel = MainViewModel(newsRepository: NewsRepository())
    
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: mainViewModel
            )
        }
    }
}
