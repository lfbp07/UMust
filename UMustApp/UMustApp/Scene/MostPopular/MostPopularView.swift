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
    
    let searchField: UISearchTextField = {
        let search = UISearchTextField()
        search.placeholder = "Nome do filme..."
        search.backgroundColor = .white
        return search
    }()
    
    let tableView = UITableView()
    
    var movieData: MostPopularResponseModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var poster: [UIImage?] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
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
        searchField.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MostPopularCustomCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 200
    }
}


extension MostPopularView: UISearchTextFieldDelegate {
    override class func didChangeValue(forKey key: String) {
        print("did change value")
    }
}

extension MostPopularView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MostPopularCustomCell {
            cell.title.text = movieData?.results[indexPath.row].title ?? "No title found"
            cell.year.text = movieData?.results[indexPath.row].releaseDate ?? "No overview found"
            if indexPath.row < poster.count, let image = poster[indexPath.row] {
                cell.poster.image = image
                cell.poster.contentMode = .scaleAspectFill
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select row: \(indexPath.row)")
    }
}

