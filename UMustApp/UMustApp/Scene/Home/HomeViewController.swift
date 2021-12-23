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
    }
    
    override func loadView() {
        view = homeView
    }
    
}


