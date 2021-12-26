//
//  ViewController.swift
//  UMustApp
//
//  Created by Luis Pereira on 22/12/21.
//

import UIKit


class HomeViewController: UIViewController {
  
    private let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewAction()
        navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setUpViewAction () {
        homeView.featuresStack.tapHandler = { tag in
            if tag == 0 {
                let vc = MostPopularViewController()
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    override func loadView() {
        view = homeView
    }
}


