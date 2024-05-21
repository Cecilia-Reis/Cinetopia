//
//  MoviesInteractors.swift
//  Cinetopia
//
//  Created by Cecilia Reis on 21/05/24.
//

import Foundation

protocol MoviesPresenterToInteractorProtocol: AnyObject{
    func fecthMovies() async throws -> [Movie]
}

class MoviesInteractor: MoviesPresenterToInteractorProtocol {
    
    private var movieService: MovieService = MovieService()
    
    func fecthMovies() async throws -> [Movie] {
        do {
            let movies = try await movieService.getMovies()
            return movies
        } catch (let error) {
            throw error
        }
    }
    
    
}
