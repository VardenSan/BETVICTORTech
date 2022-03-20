//
//  TweetDetailViewController.swift
//  BETVICTORTech
//
//  Created by Sergio TIMP on 20/3/22.
//

import UIKit
import MapKit

protocol TweetDetailViewPresenter: AnyObject {
    func setup(_ viewModels: TweetDetailViewModel)
    func hidePTR()
    func showErrorView(errorMessage: String)
}

class TweetDetailViewController: BaseViewController, TweetDetailViewPresenter {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!

    @IBOutlet weak var viewMoreButton: UIButton!
    
    @IBOutlet weak var favouriteCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var replyCountLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var secondContainerView: UIView!
    @IBOutlet weak var secondContainerHeightConstraint: NSLayoutConstraint!
    
    
    var presenter: TweetDetailPresenterView?
    var viewModel: TweetDetailViewModel?
    var secondViewVisible = false
    var ptr: Bool = false
    var errorView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshView()
    }
    
    @objc private func refreshData(_ sender: Any) {
        refreshView()
    }
    
    func setupUI() {
        self.navigationItem.setHidesBackButton(false, animated: false)
        setupRefresh()
        viewMoreButton.setTitle("View More", for: .normal)
        avatarImageView.layer.cornerRadius = 8
        hideSecondaryView()
    }
    
    func setupRefresh() {
        let refreshControl = UIRefreshControl()
        scrollView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    func hidePTR() {
        scrollView.refreshControl?.endRefreshing()
    }
    
    func refreshView() {
        hideErrorView()
        ptr = true
        presenter?.viewDidLoad()
    }
    
    func showErrorView(errorMessage: String) {
        errorView = showErrorView(view: scrollView, viewModel: ErrorViewModel(with: .commonError, errorMessage: errorMessage), selector: #selector(refreshData(_:)))
        scrollView.addSubview(errorView)
        errorView.frame = CGRect(x: scrollView.frame.minX, y: scrollView.frame.minY - 150, width: scrollView.frame.width, height: scrollView.frame.height)
    }
    
    func hideErrorView() {
        errorView.isHidden = true
    }
    
    func setup(_ viewModel: TweetDetailViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        tweetTextLabel.text = viewModel.text
        avatarImageView.kf.setImage(with: URL(string: viewModel.avatarUrl))
        
        locationLabel.text = viewModel.location
        followersCountLabel.text = viewModel.followersCount
        tweetCountLabel.text = viewModel.tweetCount
        
        favouriteCountLabel.text = viewModel.favouriteCount
        retweetCountLabel.text = viewModel.retweetCount
        replyCountLabel.text = viewModel.replyCount
        setupMap()
    }
    
    func setupMap() {
        guard let viewModel = viewModel else {
            mapView.isHidden = true
            return
        }
        if viewModel.hasGeolocation {
            mapView.isHidden = false
            let initialLocation = viewModel.geolocation
            let annotation = MKPointAnnotation()
            annotation.title = "Here!"
            annotation.coordinate = initialLocation
            mapView.addAnnotation(annotation)
            mapView.setCenter(initialLocation, animated: true)
            let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
            mapView.setCameraZoomRange(zoomRange, animated: true)
        } else {
            mapView.isHidden = true
        }
    }
    
    func showSecondaryView() {
        secondContainerHeightConstraint.constant = 300
        self.viewMoreButton.setTitle("View Less", for: .normal)
    }
    
    func hideSecondaryView() {
        secondContainerHeightConstraint.constant = 0
        self.viewMoreButton.setTitle("View More", for: .normal)
    }
    
    @IBAction func showMoreButtonPressed(_ sender: Any) {
        if secondViewVisible {
            hideSecondaryView()
        } else {
            showSecondaryView()
        }
        secondViewVisible = !secondViewVisible
    }
}
