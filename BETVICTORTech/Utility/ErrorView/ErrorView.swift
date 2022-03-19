//
//  ErrorView.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorView(view: UIView, viewModel: ErrorViewModel, topSpace: Int = 0, selector: Selector) -> UIView {
        let frame = CGRect(x: view.frame.minX, y: view.frame.minY - CGFloat(topSpace), width: view.frame.width, height: view.frame.height)
        let errorView = UIView(frame: frame)
        
        let imageView = UIImageView(frame: CGRect(x: errorView.center.x, y: errorView.center.y, width: 100, height: 100))
        imageView.image = UIImage(named: viewModel.image)

        let titleLabel = UILabel(frame: CGRect(x: errorView.center.x, y: errorView.center.y+20, width: 300, height: 22))
        titleLabel.text = viewModel.title
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textAlignment = .center
        
        let subtitleLabel = UILabel(frame: CGRect(x: errorView.center.x, y: errorView.center.y+40, width: 260, height: 80))
        subtitleLabel.text = viewModel.subtitle
        subtitleLabel.font = subtitleLabel.font.withSize(16)
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textAlignment = .center

        if #available(iOS 13.0, *) {
            errorView.backgroundColor = .systemGroupedBackground
            subtitleLabel.textColor = .secondaryLabel
        } else {
            errorView.backgroundColor = .systemGray
            subtitleLabel.textColor = .gray
        }
        
        let retryButton = UIButton(frame: CGRect(x: errorView.center.x, y: errorView.center.y+140, width: errorView.frame.width - 40, height: 50))
        retryButton.setTitle(viewModel.buttonText, for: .normal)
        retryButton.layer.cornerRadius = 8
        retryButton.setTitleColor(.blue, for: .normal)
        retryButton.addTarget(self, action: selector, for: .touchUpInside)
        
        errorView.addSubview(imageView)
        errorView.addSubview(titleLabel)
        errorView.addSubview(subtitleLabel)
        errorView.addSubview(retryButton)
        
        imageView.center = CGPoint(x: errorView.center.x, y: errorView.center.y-60)
        titleLabel.center = CGPoint(x: errorView.center.x, y: errorView.center.y+20)
        subtitleLabel.center = CGPoint(x: errorView.center.x, y: errorView.center.y+58)
        retryButton.center = CGPoint(x: errorView.center.x, y: errorView.center.y+120)
        return errorView
    }
}
