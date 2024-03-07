//
//  StringExtension.swift
//  Pokedex
//
//  Created by Reggie Barker on 6/3/24.
//

import Foundation

extension String {
    /// Helper to use localization string
    /// - Returns: String storaged in Localizable file 
    func localization() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
