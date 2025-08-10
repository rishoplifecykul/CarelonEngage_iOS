//
//  Enums.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import Foundation

// MARK: - HTTP Methods Enums
enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
    case UPDATE = "UPDATE"
}

// MARK: - Body Types
enum BodyType {
    case json
    case formURLEncoded
    case multipart(boundary: String?, media: [Media]?)
}

// MARK: - Network Error
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingFailed(Error)
    case httpError(code: Int, message: String)
    case invalidResponse
    case noInternet
    case timeout
    case networkError(Error)
    case invalidParameters
}

// MARK: - Login Type Enum
enum LoginType: String {
    case LOGIN = "login"
    case REGISTER = "register"
}

// MARK: - Login Focus Enums
enum LoginTextFieldFocus: Hashable {
    case countryCode
    case mobileNumber
}

// MARK: - Tab Enums
enum Tab: String, CaseIterable, Identifiable {
    case home, programs, record, search, menu
    
    // MARK: - ID
    var id: String { rawValue }
    
    // MARK: - Icons
    var icon: String {
        switch self {
        case .home: return "house"
        case .programs: return "book"
        case .record: return "plus.square"
        case .search: return "magnifyingglass"
        case .menu: return "ellipsis"
        }
    }
    
    // MARK: - Title
    var title: String {
        switch self {
        case .home: return "Home"
        case .programs: return "Programs"
        case .record: return "Record"
        case .search: return "Search"
        case .menu: return "Menu"
        }
    }
}

// MARK: - Home Segment
enum HomeScreenSegment: String, SegmentProtocol {
    case following, myactivities, featured
    
    // MARK: - ID
    var id: String { rawValue }
    
    // MARK: - Title
    var title: String {
        switch self {
        case .following: return "Following"
        case .myactivities: return "My Activities"
        case .featured: return "Featured"
        }
    }
}
