//
//  Constants.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 03/03/24.
//

import Foundation

struct Constants {
    static let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDc1YzZhYjhhZjc5MTMzMzBjMjRmY2QxYjZhMmY0MiIsInN1YiI6IjY1ZTJlN2ZkMWFkOTNiMDE2MzA1OTQ5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HA2Xea4VaVWxiSjMhnrBbaEuxS73vl6qD-2a3Ig8piY"
    static let baseURL = "https://api.themoviedb.org/3/movie/"
    
    struct Endpoints {
        static let nowPlaying = "now_playing"
        static let popular = "popular"
        static let credits = "/credits"
    }
}
