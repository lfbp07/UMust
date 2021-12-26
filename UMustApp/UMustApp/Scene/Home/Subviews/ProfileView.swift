//
//  ProfileView.swift
//  UMustApp
//
//  Created by Luis Pereira on 23/12/21.
//

import UIKit

class ProfileView: UIView, SetUpView {

    init() {
        super.init(frame: .zero)
        insertView()
        setConstraints()
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemFill
        return imageView
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.text = "Luis Pereira"
        label.font = .systemFont(ofSize: 24)
        label.adjustsFontSizeToFitWidth = true
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
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func insertView() {
        addSubview(userPhoto)
        addSubview(userName)
        addSubview(userDescription)
    }
    
    func setConstraints() {
        userPhoto.translatesAutoresizingMaskIntoConstraints = false
        userPhoto.heightAnchor.constraint(equalToConstant: 128).isActive = true
        userPhoto.widthAnchor.constraint(equalToConstant: 128).isActive = true
        userPhoto.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        userPhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.heightAnchor.constraint(equalToConstant: 32).isActive = true
        userName.leadingAnchor.constraint(equalTo: userPhoto.trailingAnchor, constant: 32).isActive = true
        userName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 32).isActive = true
        
        userDescription.translatesAutoresizingMaskIntoConstraints = false
        userDescription.leadingAnchor.constraint(equalTo: userName.leadingAnchor).isActive = true
        userDescription.trailingAnchor.constraint(equalTo: userName.trailingAnchor).isActive = true
        userDescription.topAnchor.constraint(equalTo: userName.topAnchor, constant: 16).isActive = true
        userDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-8).isActive = true

    }
    
    func configView() {
        userPhoto.layer.cornerRadius = 64
    }
}
