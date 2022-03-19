//
//  EmptyView.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation
import UIKit

extension UIViewController {

    func showEmptyView(view: UIView, viewModel: EmptyViewModel, topSpace: Int = 0) -> UIView {
        let frame = CGRect(x: view.frame.minX, y: view.frame.minY - CGFloat(topSpace), width: view.frame.width, height: view.frame.height)
        let emptyView = UIView(frame: frame)
        
        let imageView = UIImageView(frame: CGRect(x: emptyView.center.x, y: emptyView.center.y, width: 100, height: 100))
        imageView.image = UIImage(named: viewModel.image)

        let titleLabel = UILabel(frame: CGRect(x: emptyView.center.x, y: emptyView.center.y+20, width: 300, height: 22))
        titleLabel.text = viewModel.title
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textAlignment = .center
        
        let subtitleLabel = UILabel(frame: CGRect(x: emptyView.center.x, y: emptyView.center.y+40, width: 260, height: 60))
        subtitleLabel.text = viewModel.subtitle
        subtitleLabel.font = subtitleLabel.font.withSize(16)
        subtitleLabel.numberOfLines = 3
        subtitleLabel.textAlignment = .center
        subtitleLabel.contentMode = .top

        if #available(iOS 13.0, *) {
            emptyView.backgroundColor = .systemGroupedBackground
            subtitleLabel.textColor = .secondaryLabel
        } else {
            emptyView.backgroundColor = .clear
            subtitleLabel.textColor = .gray
        }
        
        emptyView.addSubview(imageView)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(subtitleLabel)
        
        imageView.center = CGPoint(x: emptyView.center.x, y: emptyView.center.y-60)
        titleLabel.center = CGPoint(x: emptyView.center.x, y: emptyView.center.y+20)
        
        subtitleLabel.center = CGPoint(x: emptyView.center.x, y: titleLabel.center.y+38)
        
        return emptyView
    }
}
