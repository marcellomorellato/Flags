//
//  ApiService.swift
//  Flags
//
//  Created by Marcello on 16/10/22.
//

import Foundation

// MARK: - NetworkServiceError
enum ApiServiceError: Error {
    case encodingError
    case decodingError
    case invalidUrl
    case unknown
    case serverError
}


protocol ApiService: AnyObject {
    func getCountries() async throws -> [Country]
}
