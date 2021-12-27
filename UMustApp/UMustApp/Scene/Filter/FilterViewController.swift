//
//  FilterViewController.swift
//  UMustApp
//
//  Created by Luis Pereira on 27/12/21.
//

import UIKit

class FilterViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Order by"
        label.font = .systemFont(ofSize: 32)
        label.textColor = .black
        return label
    }()
    
    let byName: UIButton = {
        let button = UIButton()
        button.setTitle("Name", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.backgroundColor = UIColor(red: 110.0/255, green: 60.0/255, blue: 188.0/255, alpha: 1.0)
        button.tag = 0
        return button
    }()
    
    let byDate: UIButton = {
        let button = UIButton()
        button.setTitle("Date", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.backgroundColor = UIColor(red: 110.0/255, green: 60.0/255, blue: 188.0/255, alpha: 1.0)
        button.tag = 1
        return button
    }()
    
    var delegate: OrderProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(byName)
        view.addSubview(byDate)
        setConstraints()
        view.backgroundColor = .systemBackground
        byName.addTarget(self, action: #selector(orderSelected), for: .touchUpInside)
        byDate.addTarget(self, action: #selector(orderSelected), for: .touchUpInside)
    }
    
    @objc
    func orderSelected(sender: UIButton) {
        delegate?.orderBy(parameter: sender.tag)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
        
        byName.translatesAutoresizingMaskIntoConstraints = false
        byName.widthAnchor.constraint(equalToConstant: 150).isActive = true
        byName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        byName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        byName.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32).isActive = true
        
        byDate.translatesAutoresizingMaskIntoConstraints = false
        byDate.widthAnchor.constraint(equalToConstant: 150).isActive = true
        byDate.heightAnchor.constraint(equalToConstant: 50).isActive = true
        byDate.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        byDate.topAnchor.constraint(equalTo: byName.bottomAnchor, constant: 16).isActive = true

    }

}

protocol OrderProtocol {
    func orderBy(parameter: Int)
}
