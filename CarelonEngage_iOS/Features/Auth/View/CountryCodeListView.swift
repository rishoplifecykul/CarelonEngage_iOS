//
//  CountryCodeListView.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - Country Code List View Model

struct CountryCodeListView: View {
    
    // MARK: - Properties
    
    @ObservedObject var countryListViewModel: CountryListViewModel
    @Binding var selectedCountryCode: String
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            List(countryListViewModel.countries, id: \.code) { country in
                Button {
                    selectedCountryCode = country.code
                    dismiss()
                } label: {
                    HStack {
                        Text("+" + country.code)
                        Text(country.name)
                    }
                } // Button
            } // List
            .navigationTitle("Select Country")
            .searchable(text: $countryListViewModel.searchText)
            .overlay(
                Group {
                    if countryListViewModel.isloading {
                        ProgressView()
                    }
                }
            )
            .alert(isPresented: Binding(
                get: { countryListViewModel.errorMessage != nil },
                set: { _ in countryListViewModel.errorMessage = nil }
            )) {
                Alert(title: Text("Error"), message: Text(countryListViewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
            }
            .onAppear {
                countryListViewModel.fetchCountries()
            }
        }
    }
}

// MARK: - Preview

#Preview {
    CountryCodeListViewPreviewWrapper()
}

private struct CountryCodeListViewPreviewWrapper: View {
    @State private var selectedCode: String = ""
    
    var body: some View {
        let viewModel = CountryListViewModel()
        viewModel.countries = [
            Country(name: "United States", code: "+1"),
            Country(name: "India", code: "+91"),
            Country(name: "United Kingdom", code: "+44")
        ]
        
        return CountryCodeListView(countryListViewModel: viewModel, selectedCountryCode: $selectedCode)
    }
}
