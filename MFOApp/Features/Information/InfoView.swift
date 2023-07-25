//
//  InfoView.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 14.07.2023.
//

import SwiftUI

struct InfoView: View {
  @State var sumMin: Int
  @State var sumMax: Int
  @State var rateMin: Int
  @State var rateMax: Int
  @State var termMin: Int
  @State var termMax: Int
  @State var precent: Int

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        VStack {
          Text("sum".localized())
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.black).opacity(0.8)
          Text("\(sumMin)-\(sumMax)")
            .font(.system(size: 14, weight: .medium))
        }.frame(width: 160, height: 80)
          .overlay(
            RoundedRectangle(cornerRadius:8)
              .stroke(Color.gray, lineWidth: 1)
          )
        VStack {
          Text("term".localized())
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.black).opacity(0.8)
          Text("\(termMin)-\(termMax)")
            .font(.system(size: 14, weight: .medium))
        }.frame(width: 160, height: 80)
          .overlay(
            RoundedRectangle(cornerRadius:8)
              .stroke(Color.gray, lineWidth: 1)
          )
      }
      HStack {
        VStack {
          Text("rate".localized())
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.black).opacity(0.8)
          Text("\(rateMin)-\(rateMax)%")
            .font(.system(size: 14, weight: .medium))
        }.frame(width: 160, height: 80)
          .overlay(
            RoundedRectangle(cornerRadius:8)
              .stroke(Color.gray, lineWidth: 1)
          )
        VStack {
          Text("Шанс одобрения")
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.black).opacity(0.8)
          HStack {
            Text("\(precent)%")
              .font(.system(size: 14, weight: .medium))
            ZStack(alignment: .leading) {
              Rectangle()
                .frame(width: 100, height: 4)
                .foregroundColor(.gray)
                .cornerRadius(15)
              Rectangle()
                .frame(width: calculatePrecent(precent: precent), height: 4)
                .foregroundColor(.blue)
                .cornerRadius(15)
            }
          }
        }.frame(width: 160, height: 80)
          .overlay(
            RoundedRectangle(cornerRadius:8)
              .stroke(Color.gray, lineWidth: 1)
          )
      }
    }.frame(width: 344, height: 200)
      .background(Color.white)
      .cornerRadius(20)
      .shadow(color: .gray, radius: 3)
  }
  func calculatePrecent(precent: Int) -> CGFloat {
    return CGFloat(precent)
  }
}
