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
    
    func getCountries(result: @escaping (Result<[Country], ApiServiceError>) -> Void){
        
        let method = "/v3.1/all"
        
        let url = configuration.baseURL.appendingPathComponent(method)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    result(.failure(.serverError))
                    return
            }
            
            guard let data = data else {
                result(.failure(.unknown))
                return
            }
            
            var decodedData: [Country]?
            
            do {
                decodedData = try JSONDecoder().decode([Country].self, from: data)
            } catch let error {
                print(error)
            }
            
            DispatchQueue.main.async {
                guard let decodedData = decodedData else {
                    result(.failure(.decodingError))
                    return
                }
                
                result(.success(decodedData))
            }
        }.resume()
    }
}

