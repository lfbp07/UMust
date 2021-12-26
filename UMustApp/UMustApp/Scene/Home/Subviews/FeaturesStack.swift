//
//  FeaturesStack.swift
//  UMustApp
//
//  Created by Luis Pereira on 23/12/21.
//

import UIKit
class FeatureStack: UIStackView, SetUpView {
    
    init() {
        super.init(frame: .zero)
        insertView()
        setConstraints()
        configView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cardColor = UIColor(red: 114.0/255, green: 103.0/255, blue: 203.0/255, alpha: 1.0)
    
    let mostPopularMovies = Features(featureName: "Populars!")
    
    let myFavotiresMovies = Features(featureName: "Favorites!")
    
    let recommendedMovies = Features(featureName: "For Me!")
    
    let moviesYouRecommended = Features(featureName: "By Me!")
    
    var tapHandler: ((Int) -> Void)?
    
    func insertView() {
        addArrangedSubview(mostPopularMovies)
        addArrangedSubview(myFavotiresMovies)
        addArrangedSubview(recommendedMovies)
        addArrangedSubview(moviesYouRecommended)
    }
    
    func setConstraints() {
        mostPopularMovies.heightAnchor.constraint(equalToConstant: 128).isActive = true
        myFavotiresMovies.heightAnchor.constraint(equalToConstant: 128).isActive = true
        recommendedMovies.heightAnchor.constraint(equalToConstant: 128).isActive = true
        moviesYouRecommended.heightAnchor.constraint(equalToConstant: 128).isActive = true
    }
    
    func configView() {
        
        let tapMost = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let tapFav = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let tapRecomm = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let tapU = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        mostPopularMovies.backgroundColor = cardColor
        mostPopularMovies.layer.cornerRadius = 12
        mostPopularMovies.addGestureRecognizer(tapMost)
        mostPopularMovies.tag = 0
        
        myFavotiresMovies.backgroundColor = cardColor
        myFavotiresMovies.layer.cornerRadius = 12
        myFavotiresMovies.addGestureRecognizer(tapFav)
        myFavotiresMovies.tag = 1
        
        recommendedMovies.backgroundColor = cardColor
        recommendedMovies.layer.cornerRadius = 12
        recommendedMovies.addGestureRecognizer(tapRecomm)
        recommendedMovies.tag = 2
        
        moviesYouRecommended.backgroundColor = cardColor
        moviesYouRecommended.layer.cornerRadius = 12
        moviesYouRecommended.addGestureRecognizer(tapU)
        moviesYouRecommended.tag = 3
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let tag = sender.view?.tag {
            tapHandler?(tag)
        }
    }
}
