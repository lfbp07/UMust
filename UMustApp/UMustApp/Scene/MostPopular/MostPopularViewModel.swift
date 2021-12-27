//
//  MostPopularViewModel.swift
//  UMustApp
//
//  Created by Luis Pereira on 25/12/21.
//

import Foundation

class MostPopularViewModel {
    
    var delegate: MostPopularViewModelProtocol?
    
    func fetchMostPopularData() {
        MostPopularRequest.fetchMostPopular(completion: {
            model, statusCode in
            if statusCode == 200 {
                self.delegate?.updateCellWithText(model: model!)
            } else if statusCode == 401 {
                self.delegate?.showErrorAlert(message: "401 Unauthorized")
            } else if statusCode == 404 {
                self.delegate?.showErrorAlert(message: "404 Not Found")
            } else {
                self.delegate?.showErrorAlert(message: "Unexpected error")
            }
        })
    }
    
    func downLoadPoster(path: String, id: Int) {
        MostPopularRequest.downloadPoster(path: path, completion: {
            data in
            self.delegate?.updateCellWithImage(data: data, id: id)
        })
    }
}
