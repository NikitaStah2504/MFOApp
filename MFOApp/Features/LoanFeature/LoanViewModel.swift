//
//  LoanViewModel.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 27.06.2023.
//

import Foundation
final class LoanViewModel: ObservableObject {
  @Published var name: String = ""
  @Published var phoneNumber: String = ""
  @Published var email: String = ""
  @Published var loanAmount: Double = 5000.0
  @Published var showLoad = false
  @Published var showModal = false
  @Published var searchLoan = ""
  @Published var model: [Card]?
  
  private let networkService = NetworkService()
  
   func showTabBar() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      self.showModal = true
    }
  }
  
  func sendData() {
    networkService.postUserData(name: name, phone: phoneNumber, email: email, loanAmount: loanAmount) { card in
      if let model = card {
        DispatchQueue.main.async {
          self.model = model
        }
      }
    }
  }
  
  func textFieldValidatorEmail(_ string: String) -> Bool {
      if string.count > 100 {
          return false
      }
      let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
      let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
      return emailPredicate.evaluate(with: string)
  }
  
  func isValidPhone(phone: String) -> Bool {
          let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
          let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
          return phoneTest.evaluate(with: phone)
      }
}
