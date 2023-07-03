//
//  LoanListCellView.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 27.06.2023.
//

import SwiftUI

struct LoanListCellView: View {
  var image: String
  var amount: String
  var org: String
  
  var body: some View {
    HStack(spacing: 50) {
      Image(image.localized())
        .resizable()
        .scaledToFit()
        .frame(width: 94, height: 30)
      Text(amount.localized())
        .font(.system(size: 14, weight: .semibold))
      NavigationLink {
        CreditCenterWebView(organizaitons: org.localized())
      } label: {
        Image(systemName: "arrow.right")
          .resizable()
          .frame(width: 8, height: 6)
          .frame(width: 20, height: 20)
          .overlay(
            RoundedRectangle(cornerRadius:8)
              .stroke(Color.blue, lineWidth: 1)
          )
      }
    }
    .frame(width: 344, height: 62)
    .background(.white)
    .cornerRadius(15)
    .shadow(color: .gray, radius: 3.0)
  }
}
