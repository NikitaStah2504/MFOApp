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
    .foregroundColor(.white)
    .background(Color.textFields)
    .cornerRadius(12)
    .padding()
    .multilineTextAlignment(.center)
    .frame(maxWidth: .infinity)
  }
}
