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
    
    let profileContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 12
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
    
    func insertView() {
        addSubview(profileContainerView)
        profileContainerView.addSubview(userPhoto)
        profileContainerView.addSubview(userName)
        profileContainerView.addSubview(userDescription)
    }
    
    func setConstraints() {
        
        profileContainerView.translatesAutoresizingMaskIntoConstraints = false
        profileContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 128).isActive = true
        profileContainerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        profileContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
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
    
    func configView() {
        backgroundColor = .systemBackground
        userPhoto.layer.cornerRadius = 64
    }
    
}

