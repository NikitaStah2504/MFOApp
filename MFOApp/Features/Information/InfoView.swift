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

  var body: some View {
    VStack(alignment: .leading, spacing: 30) {
      HStack {
        Text("sum".localized())
          .font(.system(size: 20, weight: .semibold))
          .foregroundColor(.black).opacity(0.6)
        Text("\(sumMin)-\(sumMax)")
          .font(.system(size: 14, weight: .medium))
      }
      HStack {
        Text("term".localized())
          .font(.system(size: 20, weight: .semibold))
          .foregroundColor(.black).opacity(0.6)
        Text("\(termMin)-\(termMax)")
          .font(.system(size: 14, weight: .medium))
      }
      HStack {
        Text("rate".localized())
          .font(.system(size: 20, weight: .semibold))
          .foregroundColor(.black).opacity(0.6)
        Text("\(rateMin)-\(rateMax)%")
          .font(.system(size: 14, weight: .medium))
      }
    }.frame(width: 344, height: 200)
      .background(Color.white)
      .cornerRadius(20)
      .shadow(color: .gray, radius: 3)
  }
}
