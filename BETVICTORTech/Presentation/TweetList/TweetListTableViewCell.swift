//
//  TweetListTableViewCell.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import UIKit
import Kingfisher

class TweetListTableViewCell: BasePaginationTableViewCell<TweetViewModel> {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func bind(_ viewModel: TweetViewModel) {
        nameLabel.text = viewModel.name
        tweetTextLabel.text = viewModel.text
        avatarImageView.kf.setImage(with: URL(string: viewModel.avatarUrl))
    }
}
