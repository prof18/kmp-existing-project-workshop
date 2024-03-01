//
//  NewsRepository.swift
//  NewsReader
//
//  Created by marco.gomiero on 23.11.23.
//

import Foundation

enum ParsingError: Error {
    case invalidJson
}


class NewsRepository {
    
    func fetchNews() async throws -> [News] {
        try await Task.sleep(until: .now + .seconds(2))
        
        guard let jsonData = newsJson.data(using: .utf8) else {
            throw ParsingError.invalidJson
        }
        
        do {
            let news = try JSONDecoder().decode([NewsDTO].self, from: jsonData)
            return news.map { mapToNews(dto: $0) }
        } catch {
            throw error
        }
    }
    
    func mapToNews(dto: NewsDTO) -> News {
        return News(
            title: dto.title,
            formattedDate: DateFormatterUtil.getStringTime(timeInSeconds: dto.time),
            url: dto.url
        )
    }
}
