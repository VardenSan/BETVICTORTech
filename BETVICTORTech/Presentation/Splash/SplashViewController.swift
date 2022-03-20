//
//  SplashViewController.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import UIKit

protocol SplashViewPresenter: AnyObject {

}

class SplashViewController: BaseViewController, SplashViewPresenter {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var presenter: SplashPresenterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    func setupUI() {
        imageView.image = UIImage(named: "splash")
    }
}
