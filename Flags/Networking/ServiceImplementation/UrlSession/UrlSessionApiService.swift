//
//  UrlSessionApiService.swift
//  Flags
//
//  Created by Marcello on 17/10/22.
//

import Foundation

/// URLSession implementation of ApiService
class UrlSessionApiService: ApiService{
    
    var configuration: ApiConfiguration
    
    init(configuration: ApiConfiguration){
        self.configuration = configuration
    }
    
    func getCountries() async throws -> [Country] {
        
        let method = "/v3.1/all"
        let url = configuration.baseURL.appendingPathComponent(method)
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw ApiServiceError.serverError
            }
            
            return try JSONDecoder().decode([Country].self, from: data)
        }
        catch {
            throw error
        }
        
    }
}

