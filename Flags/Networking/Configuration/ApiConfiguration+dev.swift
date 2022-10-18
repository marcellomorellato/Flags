//
//  ApiConfiguration+dev.swift
//  Flags
//
//  Created by Marcello on 16/10/22.
//

import Foundation

extension ApiConfiguration {
    
    static var standard: ApiConfiguration {
        ApiConfiguration(baseURL: URL(string: "https://restcountries.com")!)
    }
    
}
