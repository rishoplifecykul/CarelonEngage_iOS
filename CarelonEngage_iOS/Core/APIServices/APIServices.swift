//
//  APIServices.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import Foundation

struct APIServices {
    static let baseURL = "https://cykul.in/app/lifeCykul/webservice"
    static let countryCodes = baseURL + "/V3.1.2/countryCodes.php"
    static let login = baseURL + "/Vfinal/one50Login.php"
    static let validateOTP = baseURL + "/V3.1.2/validateOTP.php"
}
