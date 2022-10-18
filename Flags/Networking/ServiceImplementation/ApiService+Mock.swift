//
//  ApiService+Mock.swift
//  Flags
//
//  Created by Marcello on 17/10/22.
//

import Foundation

class MockApiService: ApiService{
    func getCountries(result: @escaping (Result<[Country], ApiServiceError>) -> Void) {
        //let flag1 = Country(cca3: "ITA"
                            //, name: CountryName(common: "Italy", official: "Italy Republic"),
                            //                            ,capital: "Rome", region: "Europe"
                            //, flags: [["png": "https://restcountries.com/data/png/ita.png"]]
        //                    )
        let flags: [Country] = []
        return result(.success(flags))
    }
    
    
    var configuration: ApiConfiguration
    
    init(configuration: ApiConfiguration){
        self.configuration = configuration
    }
    
}
