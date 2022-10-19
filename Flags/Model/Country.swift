//
//  Flag.swift
//  Flags
//
//  Created by Marcello on 17/10/22.
//

import Foundation

struct CountryName: Decodable{
    let common: String
    let official: String
}

struct Flag: Decodable {
    let png: String
    let svg: String
}

struct Country: Decodable {
    let cca2: String
    let cca3: String
    let name: CountryName
    var capital: [String]?
    let region: String
    let subregion: String?
    let flags: Flag
    let flag: String
    let population: Float
    
}

enum ImageError: Error {
    case invalidUrl
    case downloadFailed
}

extension Country {
    func flagImageURL() -> URL? {
        let url = URL(string: flags.png)
        return url
    }
}
