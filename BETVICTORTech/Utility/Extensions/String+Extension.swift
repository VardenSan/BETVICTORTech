//
//  String+Extension.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

extension String {
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
