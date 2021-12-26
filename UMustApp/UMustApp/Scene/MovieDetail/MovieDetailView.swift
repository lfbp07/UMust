//
//  MovieDetailView.swift
//  UMustApp
//
//  Created by Luis Pereira on 26/12/21.
//

import UIKit

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
    
    func insertView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stack)
        stack.addArrangedSubview(poster)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(year)
        stack.addArrangedSubview(overview)
        stack.addArrangedSubview(genre)
    }
    
    func setConstraints() {
        scrollViewConstraints()
        
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
