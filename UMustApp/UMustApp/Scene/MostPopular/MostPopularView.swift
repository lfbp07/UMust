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
    
    
    
    func insertView() {

    }
    
    func setConstraints() {

        
    }
    
    func configView() {
        backgroundColor = .systemBackground
    }
    
}


