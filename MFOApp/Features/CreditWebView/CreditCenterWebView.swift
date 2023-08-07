//
//  CreditCenterWebView.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import SwiftUI
import AppsFlyerLib

struct CreditCenterWebView: View {
  
  @ObservedObject
  var webViewModel = WebViewViewModel()
  var organizaitons: String
  @Environment(\.dismiss) var dismiss
  var body: some View {
    ZStack {
      VStack {
        HStack {
          Button {
            dismiss()
          } label: {
            Image(systemName: "arrow.left")
              .resizable()
              .scaledToFit()
              .frame(width: 20, height: 20)
          }.padding(.leading, 8)
          Spacer()
        }
        ZStack {
          WebViewContainer(webViewModel: webViewModel, loanUrl: organizaitons)
          if webViewModel.isLoading {
            ProgressView()
              .tint(.contentMain)
              .frame(height: 30)
          }
        }
      }
    }
  }
}


