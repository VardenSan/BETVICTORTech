//
//  BasePaginationViewController.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import UIKit

protocol BasePaginationViewPresenter {
    func setup(_ viewModels: [Any])
    func hidePTR()
    func refresh()
    func showError(errorMessage: String)
}
