//
//  NetworkError.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError
    case unknownError
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .noData:
            return "No data received from the server."
        case .decodingError:
            return "Failed to decode the response data."
        case .serverError:
            return "Server error occurred."
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}
