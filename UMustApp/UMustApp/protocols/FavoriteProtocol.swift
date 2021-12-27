//
//  FavoriteProtocol.swift
//  UMustApp
//
//  Created by Luis Pereira on 26/12/21.
//

import Foundation

protocol FavoriteViewModelProtocol {
    func updateCellWithText(model: FavoriteResult)
    func updateCellWithImage(data: Data, id: Int)
    func showErrorAlert(message: String)
}
