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
    
    let profileContainerView: ProfileView = {
        let view = ProfileView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    let featuresStack: FeatureStack = {
        let stack = FeatureStack()
        stack.axis = .vertical
        stack.spacing = 16
        stack.layoutMargins = .init(top: 32, left: 16, bottom: 32, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    func insertView() {
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(profileContainerView)
        contentView.addSubview(featuresStack)

    }
    
    func setConstraints() {
        scrollViewConstraints()
        profileConstraints()
        
        featuresStack.translatesAutoresizingMaskIntoConstraints = false
        featuresStack.topAnchor.constraint(equalTo: profileContainerView.bottomAnchor).isActive = true
        featuresStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        featuresStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        featuresStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
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
    
    func profileConstraints(){
        
        profileContainerView.translatesAutoresizingMaskIntoConstraints = false
        profileContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 128).isActive = true
        profileContainerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        profileContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
    }
    
}


