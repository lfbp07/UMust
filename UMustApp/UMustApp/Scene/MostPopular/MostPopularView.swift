//
//  HomeView.swift
//  UMustApp
//
//  Created by Luis Pereira on 22/12/21.
//

import UIKit


class MostPopularView: UIView, SetUpView {
    
    init(){
        super.init(frame: .zero)
        insertView()
        setConstraints()
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let searchField: UITextField = {
        let search = UITextField()
        search.placeholder = "Nome do filme..."
        search.backgroundColor = .white
        return search
    }()
    
    let tableView = UITableView()
    
    let refreshControl = UIRefreshControl()
    
    var movieData: [Result]? {
        didSet {
            filterMovieData = movieData
        }
    }
    
    var poster: [Int:UIImage?] = [:] {
        didSet {
            filterPoster = poster
        }
    }
    
    var filterMovieData: [Result]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var filterPoster: [Int:UIImage?] = [:] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var handleTap: ((Result, UIImage) -> Void)?
    
    var refreshDataHandler: (() -> Void)?
    
    var isEmpty = false
    
    func insertView() {
        addSubview(searchField)
        addSubview(tableView)
    }
    
    func setConstraints() {
        
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        searchField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        searchField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        searchField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    
    func configView() {
        backgroundColor = UIColor.init(red: 110/255.0, green: 60/255.0, blue: 188/255.0, alpha: 1.0)
        tableView.backgroundColor = .clear
        searchField.addTarget(self, action: #selector(changedValue), for: .editingChanged)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MostPopularCustomCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 200
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        refreshDataHandler?()
    }
    
    
    func endRefresh() {
        refreshControl.endRefreshing()
    }
    
    @objc
    func changedValue(_ search: UITextField) {
        filterData(key: search.text!)
    }
    
    func filterData(key: String) {
        
        if key == "" {
            filterMovieData = movieData
            filterPoster = poster
            return
        }
        
        filterMovieData = movieData?.filter({ result in
            return result.title.lowercased().contains(key.lowercased())
        })
        
        filterPoster.removeAll()
        for i in (0..<filterMovieData!.count) {
            filterPoster[filterMovieData![i].id] = poster[filterMovieData![i].id]
        }
    }
    
}


extension MostPopularView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let rows = filterMovieData?.count {
            let searchText = searchField.text ?? ""
            if !searchText.isEmpty && rows == 0 { isEmpty = true}
            else { isEmpty = false }
            
            return isEmpty ? 1 : rows
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MostPopularCustomCell {
            if !isEmpty {
                cell.title.text = filterMovieData?[indexPath.row].title ?? "No title found"
                cell.year.text = filterMovieData?[indexPath.row].releaseDate ?? "No overview found"
                cell.poster.image = filterPoster[filterMovieData![indexPath.row].id] ?? UIImage()
                return cell
            } else {
                cell.title.text = "SORRY, NO MOVIE FOUND"
                cell.year.text = "try again"
                cell.poster.image = UIImage()
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movie = filterMovieData?[indexPath.row] else { return }
        
        guard let poster = filterPoster[movie.id] else { return }
        
        handleTap?(movie, poster ?? UIImage())
    }
}

