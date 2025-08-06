//
//  CountryListViewModel.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import Foundation
import Combine

class CountryListViewModel: ObservableObject {
    @Published var countries: [Country] = []
    @Published var searchText: String = ""
    @Published var isloading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    var filteredCountries: [Country] {
        guard !searchText.isEmpty else {
            return countries
        }
        return countries.filter {
            $0.name.lowercased().contains(searchText.lowercased()) || $0.code.lowercased().contains(searchText.lowercased())
        }
    }
    
    func fetchCountries() {
        isloading = true
        errorMessage = nil
        
        let params = ["whichApp": Constants.appName]
        
        NetworkManager.shared.request(urlString: APIServices.countryCodes, method: .post, parameters: params, authorizationToken: nil) { result in
            DispatchQueue.main.async {
                self.isloading = false
                
                switch result {
                    case .success(let data):
                    do {
                        let response = try JSONDecoder().decode(Countries.self, from: data)
                        debugPrint(response)
                        self.countries = response.countries
                    } catch {
                        self.errorMessage = error.localizedDescription
                    }
                    
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
