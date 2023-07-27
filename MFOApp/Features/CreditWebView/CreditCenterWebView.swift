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
  
  var body: some View {
      ZStack {
        VStack {
          Text(webViewModel.title)
            .foregroundColor(.black)
        }
        WebViewContainer(webViewModel: webViewModel, loanUrl: organizaitons)
        if webViewModel.isLoading {
          ProgressView()
            .tint(.contentMain)
            .frame(height: 30)
        }
      }
      .onAppear {
        AppsFlyerLib.shared().logEvent(name: "Open_Web", values: [
          AFEventParamCustomerUserId: externalUserId
        ])
      }
      .onDisappear {
        AppsFlyerLib.shared().logEvent(name: "Close_Web", values: [
          AFEventParamCustomerUserId: externalUserId
        ])
        print("------------------------- === ==== = == === == ==== === ===== = == ===== = = =d=c=d=cd=")
      }
  }
}

//struct CreditCenterWebView_Previews: PreviewProvider {
//  static var previews: some View {
//    CreditCenterWebView()
//  }
//}
