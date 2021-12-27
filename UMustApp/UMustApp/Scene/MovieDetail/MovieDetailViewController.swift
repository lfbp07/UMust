

import UIKit


class MovieDetailViewController: UIViewController, MovieDetailViewModelProtocol {
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let detailView = MovieDetailView()
    let viewModel: MovieDetailViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        handleViewModel()
        setViewAction()
    }
    
    func handleViewModel() {
        viewModel.fetchLocal()
        for movie in viewModel.movieToSave {
            if let idString = movie.value(forKey: "id") as? String {
                if idString == String(viewModel.movie.id) {
                    detailView.isFavorite = true
                }
            }
        }
        detailView.poster.image = viewModel.poster
        detailView.title.text = viewModel.movie.title
        detailView.year.text = viewModel.movie.releaseDate
        detailView.overview.text = viewModel.movie.overview
        detailView.movieID = viewModel.movie.id
        viewModel.fetchGenreName()
        viewModel.fetchVideos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func loadView() {
        view = detailView
    }
    
    func setViewAction() {
        
        detailView.saveDataHandler = { id in
            print("save data: \(id)")
            self.viewModel.saveLocal(movieID: String(id))
        }
        
        detailView.deleteDataHandler = { id in 
            print("delete data \(id)")
            self.viewModel.deleteLocalData(movieID: String(id))
        }
    }

    func addGenreName(genre: String) {
        detailView.genre.text! += "\(genre), "
    }
    
    func addVideo(id: String) {
        detailView.addvideoView(id: id)
    }
    
}

