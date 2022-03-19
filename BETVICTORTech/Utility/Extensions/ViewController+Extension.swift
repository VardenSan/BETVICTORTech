//
//  ViewController+Extension.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import UIKit

var vSpinner : UIView?

extension UIViewController {
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error".localized(), message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel".localized(), style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    func showLoader(view: UIView) {
        let spinnerView = UIView.init(frame: view.bounds)
        spinnerView.backgroundColor = .secondarySystemGroupedBackground
        let ai = UIActivityIndicatorView.init(style: .medium)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            view.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
