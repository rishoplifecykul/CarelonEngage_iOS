//
//  LoginViewModel.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import Foundation
import Combine

// MARK: - Login View Model
class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var loginData: LoginModel?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    // MARK: - Verify Login
    func verifyLogin(countryCode: String, mobileNumber: String, type: String, whichApp: String) {
        isLoading = true
        errorMessage = nil
        
        let params = ["mobileNumber": mobileNumber, "code": countryCode, "type": type, "whichapp": whichApp]
        
        NetworkManager.shared.request(urlString: APIServices.login, method: .POST, parameters: params, bodyType: .formURLEncoded, responseType: LoginModel.self) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                    case .success(let data):
                    self.loginData = data
                    print(data)
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
