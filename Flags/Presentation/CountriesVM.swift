//
//  CountriesVM.swift
//  Flags
//
//  Created by Marcello on 19/10/22.
//

import Foundation

class CountriesVM {
    let service: ApiService
    @Published private(set) var countries: [Country]?
    
    init(service: ApiService = Container.shared.resolve(type: ApiService.self)!) {
        self.service = service
    }
    
    func fetchData() async {
        service.getCountries { result in
            switch result {
            case .success(let countries):
                self.countries = countries
            case .failure(let error):
                print(error)
            }
        }
    }
}
