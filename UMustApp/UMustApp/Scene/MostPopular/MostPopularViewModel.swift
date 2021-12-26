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
            model in
            self.delegate?.updateCellWithText(model: model)
        })
    }
    
    func downLoadPoster(path: String, id: Int) {
        MostPopularRequest.downloadPoster(path: path, completion: {
            data in
            self.delegate?.updateCellWithImage(data: data, id: id)
        })
    }
}
