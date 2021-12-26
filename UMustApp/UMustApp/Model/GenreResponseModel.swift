//
//  GenreResponseModel.swift
//  UMustApp
//
//  Created by Luis Pereira on 26/12/21.
//

import Foundation

struct GenreResponseModel: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int
    let name: String
}
