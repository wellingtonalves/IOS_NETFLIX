//
//  Movie.swift
//  Netflix
//
//  Created by Wellington Alves on 28/07/21.
//

struct Movie: Decodable {
    let id: Int
    let title: String
    let poster_path: String
    let overview: String
    let backdrop_path: String?

    init(id: Int, title: String, poster_path: String, overview: String, backdrop_path: String) {
        self.id = id
        self.title = title
        self.poster_path = poster_path
        self.overview = overview
        self.backdrop_path = backdrop_path
    }
}
