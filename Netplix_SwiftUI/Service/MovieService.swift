//
//  MovieService.swift
//  Netplix_SwiftUI
//
//  Created by Farendza Muda on 24/11/22.
//

import Foundation

protocol MovieService{
    
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
    func fetchMovie(id: Int, completion: @escaping(Result<Movie, MovieError>) -> ())
    func searchMovie(query: String, completion: @escaping(Result<MovieResponse, MovieError>) -> ())
}

enum MovieListEndpoint: String, CaseIterable, Identifiable {
    
    var id: String {rawValue}
    
    case nowPlaying = "now_playing"
    case popular
    case upcoming
    case latest
    case topRated = "top_rated"
    
    var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .popular: return "Popular"
        case .upcoming: return "Upcoming"
        case .latest: return "Latest"
        case .topRated: return "Top Rated"
        }
    }
}

enum MovieError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
