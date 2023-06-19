//
//  NetworkService.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import Foundation

final class NetworkService {
  
  func postUserData(name: String, phone: String, email: String, loanAmount: Double) {
    let json: [String: Any] = ["name": name, "phone": phone, "email": email, "loan_amount": loanAmount, "id": externalUserId, "appsuid": appsFlyerDevKey]
      let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)

      guard let url = URL(string: "https://vivo-sportstat.site/v2/client/add/MFOApp/MFO") else {return}
      var request = URLRequest(url: url)
      request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      request.addValue("application/json", forHTTPHeaderField: "Accept")

      request.httpMethod = "POST"
      request.httpBody = jsonData

      let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "no Data")
          return
        }
        let responseJson = try? JSONDecoder().decode(NetworkModel.self, from: data)
          if let responseJson = responseJson {
            UserDefaults.standard.set(responseJson.msg, forKey: "message")
          }
      }
      task.resume()
  }
}
