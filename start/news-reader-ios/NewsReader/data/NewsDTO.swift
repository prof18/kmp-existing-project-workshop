//
//  NewsDTO.swift
//  NewsReader
//
//  Created by marco.gomiero on 23.11.23.
//

import Foundation

struct NewsDTO: Codable {
    let by: String
    let id: Int64
    let score: Int
    let time: Int64
    let title: String
    let type: String
    let url: String
}
