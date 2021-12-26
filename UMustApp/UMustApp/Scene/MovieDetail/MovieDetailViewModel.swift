//
//  MovieDetailViewModel.swift
//  UMustApp
//
//  Created by Luis Pereira on 26/12/21.
//

import Foundation
import UIKit

class MovieDetailViewModel {
    init(movie: Result, poster: UIImage) {
        self.movie = movie
        self.poster = poster
    }
    
    let movie: Result
    let poster: UIImage
    var delegate: MovieDetailViewModelProtocol?
    
    func fetchGenreName() {
        GenreRequest.fetchGenreNames(completion: {genreResponse in
            genreResponse.genres.forEach({ genre in
                if self.movie.genreIDS.contains(genre.id) {
                    self.delegate?.addGenreName(genre: genre.name)
                }
            })
        })
    }
}

protocol MovieDetailViewModelProtocol {
    func addGenreName(genre: String)
}

