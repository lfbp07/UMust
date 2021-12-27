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
            let viewModel = MovieDetailViewModel(movie: movie, poster: image)
            let detatilVC = MovieDetailViewController(viewModel: viewModel)
            self.navigationController?.pushViewController(detatilVC, animated: true)
        }
        
        mostPopularView.refreshDataHandler = {
            self.viewModel.fetchMostPopularData()
        }
    }
    
    func updateCellWithText(model: MostPopularResponseModel) {
        mostPopularView.movieData = model.results
        for i in (0..<model.results.count) {
            viewModel.downLoadPoster(path: model.results[i].posterPath, id: model.results[i].id)
        }
        mostPopularView.endRefresh()
    }
    
    func updateCellWithImage(data: Data, id: Int) {
        mostPopularView.poster[id] = UIImage(data: data)
    }
    
    func showErrorAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ops!", message: message, preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
