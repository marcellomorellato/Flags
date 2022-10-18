//
//  Configuration.swift
//  Flags
//
//  Created by Marcello on 16/10/22.
//

import Foundation

import Foundation

// MARK: - AppConfiguration
protocol AppConfiguration {
    
}

extension AppConfiguration {
    var apiConfiguration: ApiConfiguration { .standard }
}
