//
//  NetworkModel.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import Foundation

struct NetworkModel: Codable {
  let msg: String
}

struct ProductModel: Codable {
    let cards: [Card]?
}
struct Card: Codable, Identifiable {
    var id = UUID()
    let name, special: String
    let logo: String
    let sumMin, sumMax, rateMin, rateMax: Int
    let termMin, termMax: Int
    let site: String
    let chance: Int

    enum CodingKeys: String, CodingKey {
        case name, special, logo
        case sumMin = "sum_min"
        case sumMax = "sum_max"
        case rateMin = "rate_min"
        case rateMax = "rate_max"
        case termMin = "term_min"
        case termMax = "term_max"
        case site
        case chance
    }
}
