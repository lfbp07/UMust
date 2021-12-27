//
//  MostPopularViewModelProtocol.swift
//  UMustApp
//
//  Created by Luis Pereira on 26/12/21.
//

import Foundation
protocol MostPopularViewModelProtocol {
    func updateCellWithText(model: MostPopularResponseModel)
    func updateCellWithImage(data: Data, id: Int)
    func showErrorAlert(message: String)
}
