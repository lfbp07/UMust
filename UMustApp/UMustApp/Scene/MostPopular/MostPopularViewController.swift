//
//  MostPopularViewController.swift
//  UMustApp
//
//  Created by Luis Pereira on 23/12/21.
//

import UIKit


class MostPopularViewController: UIViewController, MostPopularViewModelProtocol {
  
    private let mostPopularView = MostPopularView()
    private let viewModel = MostPopularViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        viewModel.delegate = self
        viewModel.fetchMostPopularData()
    }
    
    override func loadView() {
        view = mostPopularView
    }
    
    func setViewAction() {
        mostPopularView.handleTap = { movie, image in
            print(movie.title)
            let viewModel = MovieDetailViewModel(movie: movie, poster: image)
            let detatilVC = MovieDetailViewController(viewModel: viewModel)
            self.navigationController?.pushViewController(detatilVC, animated: true)
        }
    }
    
    func updateCellWithText(model: MostPopularResponseModel) {
        mostPopularView.movieData = model.results
        for i in (0..<model.results.count) {
            viewModel.downLoadPoster(path: model.results[i].posterPath, id: model.results[i].id)
        }
    }
    
    func updateCellWithImage(data: Data, id: Int) {
        mostPopularView.poster[id] = UIImage(data: data)
    }
}
