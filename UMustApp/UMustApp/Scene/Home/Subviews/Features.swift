//
//  Features.swift
//  UMustApp
//
//  Created by Luis Pereira on 23/12/21.
//

import UIKit

class Features: UIView, SetUpView {
    
    init(featureName: String) {
        self.featureName = featureName
        super.init(frame: .zero)
        insertView()
        setConstraints()
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let featureName: String
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Empty"
        label.font = .systemFont(ofSize: 32)
        label.textColor = .black
        return label
    }()
    
    func insertView() {
        addSubview(label)
    }
    
    func setConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func configView() {
        label.text = featureName
    }
}
