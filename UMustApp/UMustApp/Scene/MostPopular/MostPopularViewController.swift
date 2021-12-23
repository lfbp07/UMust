//
//  MostPopularViewController.swift
//  UMustApp
//
//  Created by Luis Pereira on 23/12/21.
//

import UIKit


class MostPopularViewController: UIViewController {
  
    private let mostPopularView = MostPopularView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = mostPopularView
    }
}
