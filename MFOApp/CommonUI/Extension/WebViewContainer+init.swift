//
//  WebViewContainer+init.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import Foundation
import WebKit
import SwiftUI

extension WebViewContainer {
  class Coordinator: NSObject, WKNavigationDelegate {
    @ObservedObject private var webViewModel: WebViewViewModel
    private let parent: WebViewContainer
    
    init(webViewModel: WebViewViewModel, parent: WebViewContainer) {
      self.webViewModel = webViewModel
      self.parent = parent
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
      webViewModel.isLoading = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      webViewModel.isLoading = false
      webViewModel.title = webView.title ?? ""
      webViewModel.canGoBack = webView.canGoBack
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
      webViewModel.isLoading = false
    }
  }
}

