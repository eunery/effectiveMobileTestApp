//
//  ApiSettings.swift
//  effectiveMobileTestApp
//
//  Created by Sergei Kulagin on 25.06.2024.
//

import Foundation

enum APIMethods: String {
    case get = "GET"
    case post = "POST"
}

enum Endpoints: String {
    case mainScreen = "https://run.mocky.io/v3/ad9a46ba-276c-4a81-88a6-c068e51cce3a"
    case search = "https://run.mocky.io/v3/38b5205d-1a3d-4c2f-9d77-2f9d1ef01a4a"
    case allTickets = "https://run.mocky.io/v3/c0464573-5a13-45c9-89f8-717436748b69"
}

enum APIError: Error, LocalizedError {
    case badURL
    case badResponse(statusCode: Int)
    case emptyResponse
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
        
    var errorDescription: String? {
        
        switch self {
        case .badURL:
            return "Invalid url. Check credentials."
        case .parsing:
            return "Parsing error. Check Models."
        case .unknown:
            return "Unknown error."
        case .badResponse(let statusCode):
            return "Bad Response. Status code: \(statusCode)"
        case .emptyResponse:
            return "Empty response."
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong"
        }
    }
}
