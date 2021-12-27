//
//  FavoriteResult.swift
//  UMustApp
//
//  Created by Luis Pereira on 26/12/21.
//

import Foundation

struct FavoriteResult {
    let id: Int
    let originalTitle, overview: String
    let posterPath, releaseDate: String
    let genreIDS: [GenreModel]
}
