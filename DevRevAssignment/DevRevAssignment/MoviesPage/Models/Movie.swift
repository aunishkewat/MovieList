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
    let overview: String
    let releaseDate: String
    let posterPath: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
    
    var fullPosterPath: String {
        return "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
}
