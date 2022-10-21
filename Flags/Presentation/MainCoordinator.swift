//
//  MainCoordinator.swift
//  Flags
//
//  Created by Marcello on 19/10/22.
//

import Foundation
import UIKit
import Combine

class MainCoordinator: NSObject, Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.startCountries()
    }
    
    func startCountries(){
        let vc = CountriesVC.instantiate()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func startCountryDetail(country: Country){
        let vc = CountryDetailVC.instantiate()
        vc.viewModel = CountryDetailVM(country: country)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
