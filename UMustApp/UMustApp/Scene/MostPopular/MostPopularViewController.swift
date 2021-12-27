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
        let button = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3.decrease.circle"), style: .plain, target: self, action: #selector(filterTapped))
        navigationItem.rightBarButtonItem = button
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        viewModel.delegate = self
        viewModel.fetchMostPopularData()
    }
    
    override func loadView() {
        view = mostPopularView
    }
    
    @objc
    func filterTapped() {
        let vc = FilterViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true, completion: nil)
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

extension MostPopularViewController: OrderProtocol {
    func orderBy(parameter: Int) {
        if parameter == 0 {
            print("order by name")
            mostPopularView.filterMovieData?.sort(by: {a,b in
                a.originalTitle < b.originalTitle
            })
        }else if parameter == 1 {
            print("order by date")
            mostPopularView.filterMovieData?.sort(by: {a,b in
                a.releaseDate < b.releaseDate
            })
        } else {
            
        }
    }
    
    
}
