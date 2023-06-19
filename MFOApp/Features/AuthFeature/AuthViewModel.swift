//
//  AuthViewModel.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import Foundation

final class AuthViewModel: ObservableObject {
  @Published var name: String = ""
  @Published var phoneNumber: String = ""
  @Published var email: String = ""
  @Published var loanAmount: Double = 0.0
  @Published var showLoad = false
  private let networkService = NetworkService()
  
  func sendData() {
    networkService.postUserData(name: name, phone: phoneNumber, email: email, loanAmount: loanAmount)
  }
}
