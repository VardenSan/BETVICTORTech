//
//  ViewController+Extension.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import UIKit

extension UIViewController {
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error".localized(), message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel".localized(), style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
}
