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
        // Do any additional setup after loading the view.
        homeView.featuresStack.tapHandler = { tag in
            if tag == 0 {
                let vc = MostPopularViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
    }
    
    override func loadView() {
        view = homeView
    }
}


