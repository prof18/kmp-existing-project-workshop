//
//  UiState.swift
//  NewsReader
//
//  Created by marco.gomiero on 23.11.23.
//

import Foundation
import NewsReaderKMP

enum UiState {
    case loading
    case success(newsList: [News])
    case error(message: String)
}
