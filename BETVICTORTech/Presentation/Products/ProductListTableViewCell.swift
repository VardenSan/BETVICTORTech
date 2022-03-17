//
//  ProductListTableViewCell.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 6/3/22.
//

import UIKit
import Kingfisher

class ProductListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    func bind(viewModel: ProductViewModel) {
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        tagsLabel.text = viewModel.tag
        productImageView.kf.setImage(with: URL(string: viewModel.image))
    }
}
