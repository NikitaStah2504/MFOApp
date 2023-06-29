//
//  UIApplication+Init.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 28.06.2023.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
