//
//  CountryListViewModel.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import Foundation

// MARK: - Country List View Model
class CountryListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var countries: [Country] = []
    @Published var searchText: String = ""
    @Published var isloading: Bool = false
    @Published var errorMessage: String? = nil
    
    let countryMobileDigitLimits: [String: Int] = [
        "+91": 10, // India
        "+1": 10,  // US
        "+44": 11, // UK
        "+971": 9, // UAE
        "+81": 10, // Japan
    ]
    
    var filteredCountries: [Country] {
        guard !searchText.isEmpty else {
            return countries
        }
        return countries.filter {
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.code.contains(searchText)
        }
    }
    
    // MARK: - Get Max Length
    func getMaxLength(for countryCode: String) -> Int {
        switch countryCode.trimmingCharacters(in: .whitespacesAndNewlines) {
        case "+91": return 10   // India
        case "+1":  return 10   // USA/Canada
        case "+44": return 10   // UK
        case "+61": return 9    // Australia (example)
        case "+81": return 10   // Japan (example)
        default:    return 15   // E.164 fallback
        }
    }
    
    // MARK: - IsValid Mobile Number
    func isValidMobileNumber(_ number: String, for countryCode: String) -> Bool {
        let digits = number.filter { $0.isNumber }
        guard !countryCode.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return false }
        let reqLen = getMaxLength(for: countryCode)
        return digits.count == reqLen
    }
    
    // MARK: - Limit Mobile Number
    func limitMobileNumber(_ number: String, for countryCode: String) -> String {
        let digits = number.filter { $0.isNumber }
        let max = getMaxLength(for: countryCode)
        return String(digits.prefix(max))
    }
    
    // MARK: - Fetch Countries
    func fetchCountries() {
        isloading = true
        errorMessage = nil
        
        let params = ["whichapp": Constants.appNameShort]
        
        NetworkManager.shared.request(urlString: APIServices.countryCodes, method: .POST, parameters: params, bodyType: .json, responseType: Countries.self) { result in
            DispatchQueue.main.async {
                self.isloading = false
                
                switch result {
                case .success(let data):
                    self.countries = data.countries
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
