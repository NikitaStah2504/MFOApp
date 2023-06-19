//
//  CreditCenterWebView.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import SwiftUI
import AppsFlyerLib
import PopupView

struct CreditCenterWebView: View {
  @Environment(\.colorScheme) var colorScheme
  @StateObject var webViewModel = WebViewViewModel()
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          Text(webViewModel.title)
            .foregroundColor(.black)
        }
          WebViewContainer(webViewModel: webViewModel)
         .toolbar {
          toolbar()
        }
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
      } .onDisappear {
        AppsFlyerLib.shared().logEvent(name: "Close_Web", values: [
          AFEventParamCustomerUserId: externalUserId
        ])
        UserDefaults.standard.set(false, forKey: "firstLaunch")
      }
    }
  }
  
  @ToolbarContentBuilder private func toolbar() -> some ToolbarContent {
    ToolbarItem(placement: .navigationBarLeading) {
      Button {
        webViewModel.shouldGoBack.toggle()
      } label: {
        Image(systemName: "arrow.backward")
          .font(.system(size: 30, weight: .regular))
                      .imageScale(.medium)
                      .foregroundColor(colorScheme == .dark ? .white : .black)
      }
    }
  }
}

struct CreditCenterWebView_Previews: PreviewProvider {
  static var previews: some View {
    CreditCenterWebView()
  }
}
