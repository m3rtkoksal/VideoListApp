//
//  VideoModel.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import Foundation

struct VideoModel: Decodable {
    var vidoeId: String {
        return id
    }
    let id: String
    let title: String
    let hlsURL: String
    let fullURL: String
    let description: String
    let publishedAt: String
    let author: Author
}

struct Author: Decodable {
    let id: String
    let name: String
}
