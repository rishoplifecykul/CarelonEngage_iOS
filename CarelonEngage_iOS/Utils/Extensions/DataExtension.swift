//
//  DataExtension.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 08/08/25.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
