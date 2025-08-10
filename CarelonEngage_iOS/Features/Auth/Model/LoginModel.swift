//
//  LoginModel.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import Foundation

// MARK: - Login Model
struct LoginModel: Codable {
    let resultStatus, mobileNumber, reportStatus, reportStatusNew: String?
    let timer: String?
    let issuesList, locationList: [String]?
}
