//
//  WebViewModel.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import Foundation
import WebKit

@MainActor
final class WebViewViewModel: ObservableObject {
  @Published var isLoading: Bool = false
  @Published var canGoBack: Bool = false
  @Published var reload: Bool = false
  @Published var shouldReload: Bool = false
  @Published var goHome: Bool = false
  @Published var shouldGoBack: Bool = false
  @Published var title: String = ""
  @Published var showBottomSheet: Bool = false
 
    
}
