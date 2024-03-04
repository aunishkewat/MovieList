//
//  Movie.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 03/03/24.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let genreIDs: [Int]
    let originalLanguage: String
    let backdropPath: String
    let posterPath: String
    let popularity: Double
    let voteAverage: Double
    let voteCount: Int
    let adult: Bool
    let video: Bool

    enum CodingKeys: String, CodingKey {
        case id, title, overview, adult, video, popularity
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case genreIDs = "genre_ids"
        case originalLanguage = "original_language"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
}
