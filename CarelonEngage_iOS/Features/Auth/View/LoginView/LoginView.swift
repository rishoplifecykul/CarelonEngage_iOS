//
//  LoginView.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import SwiftUI

// MARK: - Login View
struct LoginView: View {
    
    // MARK: - Properties
    @State private var countryCode: String = ""
    @State private var mobileNumber: String = ""
    @State private var showCountryCodeSelector = false
    @StateObject private var countryListViewModel = CountryListViewModel()
    @StateObject private var loginViewModel = LoginViewModel()
    @FocusState private var isCountryCodeFocused: Bool
    @FocusState private var isMobileNumberFocused: Bool
    
    // sanitized digits-only mobile number
    private var sanitizedMobile: String {
        mobileNumber.filter { $0.isNumber }
    }
    
    // single source of truth for whether login should be enabled
    private var isLoginEnabled: Bool {
        !countryCode.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        countryListViewModel.isValidMobileNumber(sanitizedMobile, for: countryCode)
    }
    
    // MARK: - View
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Text(Constants.LoginScreen.loginScreenTitle)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                } // HStack
                .frame(height: 35)
                .background(Color.appBaseColor)
                
                GeometryReader { geometry in
                    VStack(spacing: 4) {
                        Image("LoginLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: geometry.size.width * 0.2,
                                height: geometry.size.height * 0.1
                            )
                            .clipped()
                            .frame(maxWidth: .infinity)
                            .padding(.top, 12)
                        
                        Text(Constants.appName)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.appBaseColor)
                        
                        HStack(spacing: 10) {
                            FloatingTextField(
                                title: Constants.LoginScreen.countryCodeTextFieldPlaceholder,
                                keyboardType: .phonePad,
                                isEditable: false,
                                text: $countryCode,
                                isFocused: $isCountryCodeFocused
                            )
                            .frame(width: geometry.size.width * 0.32)
                            .onTapGesture {
                                showCountryCodeSelector = true
                                isCountryCodeFocused = false
                            }
                            
                            Group {
                                FloatingTextField(
                                    title: Constants.LoginScreen.mobileNumberTextFieldPlaceholder,
                                    keyboardType: .numberPad,
                                    isEditable: true,
                                    text: $mobileNumber,
                                    isFocused: $isMobileNumberFocused
                                )
                                .onChange(of: mobileNumber) { oldValue, newValue in
                                    mobileNumber = countryListViewModel.limitMobileNumber(newValue, for: countryCode)
                                }
                            } // Group
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        isCountryCodeFocused = false
                                        isMobileNumberFocused = false
                                    }
                                }
                            }
                        }// HStack
                        .padding(.horizontal, 18)
                        .padding(.top, 22)
                        .fullScreenCover(isPresented: $showCountryCodeSelector) {
                            NavigationStack {
                                CountryCodeListView(
                                    countryListViewModel: countryListViewModel,
                                    selectedCountryCode: $countryCode
                                )
                            }
                        }
                        
                        Button(action: {
                            let sanitizedCode = countryCode.replacingOccurrences(of: "+", with: "")
                            loginViewModel.verifyLogin(countryCode: sanitizedCode, mobileNumber: mobileNumber, type: LoginType.LOGIN.rawValue, whichApp: Constants.appNameShort)
                        }) {
                            Text(Constants.LoginScreen.loginButtonTitle)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.appBaseColor)
                                .cornerRadius(8)
                        }
                        .disabled(!isLoginEnabled)
                        .allowsHitTesting(isLoginEnabled)
                        .opacity(isLoginEnabled ? 1.0 : 0.6)
                        .padding(.horizontal, 18)
                        .padding(.top)
                        
                        Spacer()
                    }// Vstack
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .onChange(of: countryCode) { _ , _ in
                        mobileNumber = countryListViewModel.limitMobileNumber(mobileNumber, for: countryCode)
                    }
                }// Geometry
            }// Vstack
            CurvedBottomShape()
                .fill(Color.appBaseColor)
                .frame(height: UIScreen.main.bounds.height * 0.25)
                .ignoresSafeArea(edges: .bottom)
        }// ZStack
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            isCountryCodeFocused = false
            isMobileNumberFocused = false
        }
    }
}

// MARK: - Preview

#Preview {
    LoginView()
}
