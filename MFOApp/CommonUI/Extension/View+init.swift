//
//  View+init.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import SwiftUI
import Foundation

extension View {
  func placeholder<Content: View>(when shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
    ZStack(alignment: alignment) {
      placeholder().opacity(shouldShow ? 1 : 0)
      self
    }
  }
}
