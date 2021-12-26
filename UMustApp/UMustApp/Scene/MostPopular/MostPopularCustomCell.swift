//
//  MostPopularCustomCell.swift
//  UMustApp
//
//  Created by Luis Pereira on 25/12/21.
//

import UIKit

class MostPopularCustomCell: UITableViewCell, SetUpView {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        insertView()
        setConstraints()
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemFill
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Movie Titjsjdasdkahksdasjle"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    let year: UILabel = {
        let label = UILabel()
        label.text = "year"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    func insertView() {
        addSubview(poster)
        addSubview(title)
        addSubview(year)
    }
    
    func setConstraints() {
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        poster.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        poster.widthAnchor.constraint(equalToConstant: 100).isActive = true
        poster.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 16).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        
        year.translatesAutoresizingMaskIntoConstraints = false
        year.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
        year.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        year.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
    }
    
    func configView() {
    }

}
