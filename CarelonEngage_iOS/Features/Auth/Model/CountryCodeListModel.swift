//
//  CountryCodeListModel.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import Foundation

// MARK: - Countries

struct Countries: Codable {
    let countries: [Country]
}

// MARK: - Country

struct Country: Codable {
    let name, code: String
}
