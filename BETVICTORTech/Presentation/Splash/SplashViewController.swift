//
//  SplashViewController.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 6/3/22.
//

import UIKit

protocol SplashViewPresenter {

}

class SplashViewController: UIViewController, SplashViewPresenter {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var presenter: SplashPresenterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    func setupUI() {
        imageView.image = UIImage(named: "mytoys-splash")
    }
}
