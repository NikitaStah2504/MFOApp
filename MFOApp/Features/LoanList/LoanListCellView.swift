//
//  LoanListCellView.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 27.06.2023.
//

import SwiftUI

struct LoanListCellView: View {
  var image: String
  var amount: Int
  var org: String
  var sumMin: Int
  var sumMax: Int
  var rateMin: Int
  var rateMax: Int
  var termMin: Int
  var termMax: Int
  @State private var expand = false
  
  var body: some View {
    VStack {
      HStack {
        HStack(spacing: 20) {
        AsyncImage(url: URL(string: image)) { image in
          image
            .resizable()
            .scaledToFit()
            .frame(width: 94, height: 50)
        } placeholder: {
          ProgressView()
            .background(Color.white)
            .frame(width: 94, height: 30)
        }
        Text("\(amount)")
          .font(.system(size: 14, weight: .semibold))
          .frame(width: 94, height: 30)
        }.padding()
        HStack(spacing: 20) {
          Button {
            expand.toggle()
          } label: {
            if expand {
              Image(systemName:"chevron.up")
                .resizable()
                .frame(width: 13, height: 6)
            } else {
              Image(systemName: "info.circle")
                .resizable()
                .frame(width: 20, height: 20)
            }
          }
          NavigationLink {
            CreditCenterWebView(organizaitons: org)
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
        }.padding()
      }
      .frame(width: 344, height: 62)
      .background(.white)
      .cornerRadius(15)
      .shadow(color: .gray, radius: 3.0)
      .animation(.spring())
      if expand {
        InfoView(sumMin: sumMin, sumMax: sumMax, rateMin: rateMin, rateMax: rateMax, termMin: termMin, termMax: termMax)
      }
    }
  }
}
