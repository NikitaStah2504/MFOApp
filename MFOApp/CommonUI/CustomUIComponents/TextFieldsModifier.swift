//
//  TextFieldsModifier.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import SwiftUI

struct TextFieldsModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
    .frame(height: 54)
    .foregroundColor(.black)
    .cornerRadius(12)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .stroke(Color.blue, lineWidth: 1)
    )
    .multilineTextAlignment(.center)
    .frame(maxWidth: .infinity)
  }
}
