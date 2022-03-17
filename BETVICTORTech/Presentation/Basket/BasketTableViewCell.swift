//
//  BasketTableViewCell.swift
//  myToysTechlab (iOS)
//
//  Created by Sergio TIMP on 6/3/22.
//


import UIKit
import Kingfisher

class BasketTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    func bind(viewModel: ProductViewModel) {
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        tagsLabel.text = viewModel.tag
        discountLabel.isHidden = viewModel.discount == DiscountType.NONE
        discountLabel.text = viewModel.totalDiscount
        quantityLabel.text = viewModel.quantity
        let finalPrice = String(format: "%.2f", viewModel.finalPrice)
        totalPriceLabel.text = "Total: \(finalPrice)"
        productImageView.kf.setImage(with: URL(string: viewModel.image))
    }
}
