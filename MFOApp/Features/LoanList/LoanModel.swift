//
//  LoanModel.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 28.06.2023.
//

import Foundation

struct LoanModel: Identifiable {
  var id = UUID()
  let image: String
  let loan: String
  let url: String
}
