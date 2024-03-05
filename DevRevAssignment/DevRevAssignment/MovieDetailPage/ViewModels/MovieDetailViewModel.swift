//
//  MovieDetailViewModel.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 04/03/24.
//

import Foundation
import CustomNetworkPackage

class MovieDetailViewModel {
    
    private let apiKey = Constants.apiKey
    private let baseURL = Constants.baseURL
    
    var movieDetail: MovieDetail?
    var movieCast: [CastMember] = []
    
    func fetchMovieDetails(movieId: Int, completion: @escaping (Bool, Error?) -> Void) {
        CustomNetworkPackage.shared.getRequest(url: baseURL + "\(movieId)", bearerToken: apiKey)  { [weak self] data, response, error in
            guard let data = data, error == nil else {
                completion(false, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                self?.movieDetail = try decoder.decode(MovieDetail.self, from: data)
                completion(true, nil)
            } catch {
                completion(false, error)
            }
        }
    }
}
//MARK: - Get cast
extension MovieDetailViewModel {
    
    func fetchMovieCast(movieId: Int, completion: @escaping (Bool, Error?) -> Void) {
        CustomNetworkPackage.shared.getRequest(url: baseURL + "\(movieId)\(Constants.Endpoints.credits)", bearerToken: apiKey)  { [weak self] data, response, error in
            guard let data = data, error == nil else {
                completion(false, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let castResponse = try decoder.decode(CastResponse.self, from: data)
                self?.movieCast = castResponse.cast.sorted { $0.order < $1.order }
                completion(true, nil)
            } catch {
                completion(false, error)
            }
        }
    }
}
