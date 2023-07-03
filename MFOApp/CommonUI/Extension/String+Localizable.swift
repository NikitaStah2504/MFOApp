//
//  String+Localizable.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 03.07.2023.
//

import Foundation

public extension String {
  func localized() -> String {
    NSLocalizedString(self, comment: self)
  }
}
