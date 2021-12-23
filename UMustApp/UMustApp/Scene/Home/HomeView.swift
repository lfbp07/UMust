//
//  HomeView.swift
//  UMustApp
//
//  Created by Luis Pereira on 22/12/21.
//

import UIKit


class HomeView: UIView, SetUpView {
    
    init(){
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
    
    let profileContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    let profileBackGround: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 144.0/255, green: 103.0/255, blue: 203.0/255, alpha: 1.0)
        return view
    }()
    
    let userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemFill
        return imageView
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.text = "Luis Pereira"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    let userDescription: UILabel = {
        let label = UILabel()
        label.text = "Oi, meu nome é Luisão da Massa, só me recomende filmes cults iranianos, por favor."
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let featuresStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.layoutMargins = .init(top: 32, left: 16, bottom: 32, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    let mostPopularMovies = UIView()
    let myFavotiresMovies = UIView()
    
    func insertView() {
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(profileBackGround)
        contentView.addSubview(profileContainerView)
        contentView.addSubview(featuresStack)
        
        featuresStack.addArrangedSubview(mostPopularMovies)
        featuresStack.addArrangedSubview(myFavotiresMovies)
        
        profileContainerView.addSubview(userPhoto)
        profileContainerView.addSubview(userName)
        profileContainerView.addSubview(userDescription)
    }
    
    func setConstraints() {
        scrollViewConstraints()
        profileConstraints()
        
        featuresStack.translatesAutoresizingMaskIntoConstraints = false
        featuresStack.topAnchor.constraint(equalTo: profileContainerView.bottomAnchor).isActive = true
        featuresStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        featuresStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        featuresStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        mostPopularMovies.heightAnchor.constraint(equalToConstant: 300).isActive = true
        myFavotiresMovies.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    func configView() {
        scrollView.backgroundColor = UIColor.init(red: 110/255.0, green: 60/255.0, blue: 188/255.0, alpha: 1.0)
        userPhoto.layer.cornerRadius = 64
        mostPopularMovies.backgroundColor = .green
        myFavotiresMovies.backgroundColor = .orange
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
    
    func profileConstraints(){
        profileBackGround.translatesAutoresizingMaskIntoConstraints = false
        profileBackGround.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        profileBackGround.bottomAnchor.constraint(equalTo: profileContainerView.bottomAnchor).isActive = true
        profileBackGround.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        profileBackGround.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        profileContainerView.translatesAutoresizingMaskIntoConstraints = false
        profileContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 128).isActive = true
        profileContainerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        profileContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
       // profileContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        userPhoto.translatesAutoresizingMaskIntoConstraints = false
        userPhoto.heightAnchor.constraint(equalToConstant: 128).isActive = true
        userPhoto.widthAnchor.constraint(equalToConstant: 128).isActive = true
        userPhoto.centerYAnchor.constraint(equalTo: profileContainerView.centerYAnchor).isActive = true
        userPhoto.leadingAnchor.constraint(equalTo: profileContainerView.leadingAnchor, constant: 8).isActive = true
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.heightAnchor.constraint(equalToConstant: 32).isActive = true
        userName.leadingAnchor.constraint(equalTo: userPhoto.trailingAnchor, constant: 32).isActive = true
        userName.trailingAnchor.constraint(equalTo: profileContainerView.trailingAnchor, constant: -8).isActive = true
        userName.topAnchor.constraint(equalTo: profileContainerView.topAnchor, constant: 32).isActive = true
        
        userDescription.translatesAutoresizingMaskIntoConstraints = false
        userDescription.leadingAnchor.constraint(equalTo: userName.leadingAnchor).isActive = true
        userDescription.trailingAnchor.constraint(equalTo: userName.trailingAnchor).isActive = true
        userDescription.topAnchor.constraint(equalTo: userName.topAnchor, constant: 16).isActive = true
        userDescription.bottomAnchor.constraint(equalTo: profileContainerView.bottomAnchor, constant:-16).isActive = true
        
    }
    
}


