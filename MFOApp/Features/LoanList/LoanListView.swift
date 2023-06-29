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
          .frame(width: 400, height: 170)
          .padding(.top, -310)
        VStack(alignment: .center) {
          Text("Chúng tôi khuyên bạn nên gửi hồ sơ đến 3 công ty để tăng khả năng được duyệt khoản vay")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .padding()
          ZStack {
            Color.backList
            ScrollView(showsIndicators: false) {
              LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(viewModel.model) { item in
                  LoanListCellView(image: item.image, amount: item.loan, org: item.url)
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
  }
}

struct LoanListView_Previews: PreviewProvider {
  static var previews: some View {
    LoanListView().environmentObject(LoanViewModel())
  }
}
