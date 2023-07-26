//
//  LoanListView.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 27.06.2023.
//

import SwiftUI

struct LoanListView: View {
  @EnvironmentObject
  var viewModel: LoanViewModel
  
  private var gridItemLayout = [GridItem(.flexible())]
  
  var body: some View {
    NavigationView {
      ZStack {
        Image("backImage")
          .resizable()
          .scaledToFill()
          .frame(height: 170)
          .padding(.top, -310)
        VStack(alignment: .center) {
          Text("mainTitleText")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .padding()
          ZStack {
            Color.backList
            ScrollView(showsIndicators: false) {
              LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(viewModel.model ?? []) { item in
                  LoanListCellView(image: item.logo, amount: item.sumMax, org: item.site, sumMin: item.sumMin, sumMax: item.sumMax, rateMin: item.rateMin, rateMax: item.rateMax, termMin: item.termMin, termMax: item.termMax, precent: item.chance)
                }
              }.padding(.top, 30)
            }
          }.frame(width: 362, height: 630)
            .cornerRadius(15)
        }
      }
      .onDisappear {
        UserDefaults.standard.set(false, forKey: "firstLaunch")
      }
    }
    .onAppear {
      viewModel.sendData()
    }
  }
}

struct LoanListView_Previews: PreviewProvider {
  static var previews: some View {
    LoanListView().environmentObject(LoanViewModel())
  }
}
