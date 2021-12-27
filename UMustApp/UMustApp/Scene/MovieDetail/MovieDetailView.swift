//
//  MovieDetailView.swift
//  UMustApp
//
//  Created by Luis Pereira on 26/12/21.
//

import UIKit
import youtube_ios_player_helper
import CloudKit

class MovieDetailView: UIView, SetUpView {
    
    init() {
        super.init(frame: .zero)
        insertView()
        setConstraints()
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.layoutMargins = .init(top: 64, left: 16, bottom: 32, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.spacing = 32
        return stack
    }()
    
    let favorite: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "star")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let favoriteContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemFill
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Movie Tile"
        label.font = .systemFont(ofSize: 26)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    let year: UILabel = {
        let label = UILabel()
        label.text = "year"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    let overview: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let genre: UILabel = {
        let label = UILabel()
        label.text = "Genres: "
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var isFavorite = false {
        didSet {
            if isFavorite {
                favorite.setImage(UIImage(systemName: "star.fill"), for: .normal)
            } else {
                favorite.setImage(UIImage(systemName: "star"), for: .normal)
            }
        }
    }
    
    var movieID: Int?
    var saveDataHandler: ((Int) -> Void)?
    var deleteDataHandler: ((Int) -> Void)?
    
    func insertView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stack)
        favoriteContainerView.addSubview(favorite)
        stack.addArrangedSubview(favoriteContainerView)
        stack.addArrangedSubview(poster)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(year)
        stack.addArrangedSubview(overview)
        stack.addArrangedSubview(genre)
    }
    
    func setConstraints() {
        scrollViewConstraints()
        
        favoriteContainerView.translatesAutoresizingMaskIntoConstraints = false
        favoriteContainerView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        favorite.translatesAutoresizingMaskIntoConstraints = false
        favorite.widthAnchor.constraint(equalToConstant: 32).isActive = true
        favorite.heightAnchor.constraint(equalToConstant: 32).isActive = true
        favorite.centerYAnchor.constraint(equalTo: favoriteContainerView.centerYAnchor).isActive = true
        favorite.trailingAnchor.constraint(equalTo: favoriteContainerView.trailingAnchor).isActive = true
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 32)*3/2).isActive = true
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    func configView() {
        scrollView.backgroundColor = UIColor.init(red: 110/255.0, green: 60/255.0, blue: 188/255.0, alpha: 1.0)
        favorite.addTarget(self, action: #selector(tapFavorite), for: .touchUpInside)
    }
    
    @objc
    func tapFavorite(sender: UIButton) {
        isFavorite.toggle()
        if isFavorite {
            saveDataHandler?(movieID ?? -1)
        } else {
            deleteDataHandler?(movieID ?? -1)
        }
    }
    
    
    
    func addvideoView(id: String) {
        let view = YTPlayerView()
        view.backgroundColor = .black
        view.load(withVideoId: id, playerVars: ["playsinline": 1])
        view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width*2/3).isActive = true
        stack.addArrangedSubview(view)
    }
    
    func scrollViewConstraints() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}
