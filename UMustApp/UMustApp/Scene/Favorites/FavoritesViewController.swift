//
//  MostPopularViewController.swift
//  UMustApp
//
//  Created by Luis Pereira on 23/12/21.
//

import UIKit


class FavoritesViewController: UIViewController, FavoriteViewModelProtocol {
  
    private let favoriteView = FavoritesView()
    private let viewModel = FavoritesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        viewModel.delegate = self
        favoriteView.movieData?.removeAll()
        viewModel.fetchLocal()
        viewModel.fetchMovies()
    }
    
    override func loadView() {
        view = favoriteView
    }
    
    func setViewAction() {
        favoriteView.handleTap = { movie, image in
            print(movie.title)
            let viewModel = MovieDetailViewModel(movie: movie, poster: image)
            let detatilVC = MovieDetailViewController(viewModel: viewModel)
            self.navigationController?.pushViewController(detatilVC, animated: true)
        }
    }
    
    func updateCellWithText(model: FavoriteResult) {
        favoriteView.movieData?.append(model)
        viewModel.downLoadPoster(path: model.posterPath, id: model.id)
    }
    
    func updateCellWithText(model: MostPopularResponseModel) {
    }
    
    func updateCellWithImage(data: Data, id: Int) {
        favoriteView.poster[id] = UIImage(data: data)
    }
}
