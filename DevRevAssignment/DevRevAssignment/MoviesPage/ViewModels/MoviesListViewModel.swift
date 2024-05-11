//
//  MoviesListViewModel.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 03/03/24.
//

import Foundation
import CustomNetwork

class MovieListViewModel {
    private let apiKey = Constants.apiKey
    private let baseURL = Constants.baseURL
    
    var movies: [Movie] = []
    
    func fetchPopularMovies(endPoint: String,completion: @escaping (Bool, Error?) -> Void) {
        NetworkManager.shared.getRequest(url: baseURL + endPoint, bearerToken: apiKey)  { [weak self] data, response, error in
            guard let data = data, error == nil else {
                completion(false, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movieResponse = try decoder.decode(MovieResponse.self, from: data)
                self?.movies = movieResponse.results 
                completion(true, nil)
            } catch {
                completion(false, error)
            }
        }
    }
}
