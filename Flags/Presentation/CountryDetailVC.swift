//
//  CountryDetailVC.swift
//  Flags
//
//  Created by Marcello on 19/10/22.
//

import Foundation
import UIKit

class FieldBoxView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
}

class CountryDetailVC: BaseVC {
    var viewModel: CountryDetailVM?
    @IBOutlet weak var cca2FB: FieldBoxView!
    @IBOutlet weak var cca3FB: FieldBoxView!
    @IBOutlet weak var officialNameFB: FieldBoxView!
    @IBOutlet weak var capitalFB: FieldBoxView!
    @IBOutlet weak var populationFB: FieldBoxView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    func setup(){
        guard let country = viewModel?.country else { return }
        
        cca2FB.titleLabel.text = "cca2"
        cca3FB.titleLabel.text = "cca3"
        officialNameFB.titleLabel.text = "officialName"
        capitalFB.titleLabel.text = "capital"
        populationFB.titleLabel.text = "population"
        
        cca2FB.valueLabel.text = country.cca2
        cca3FB.valueLabel.text = country.cca2
        officialNameFB.valueLabel.text = country.name.official
        capitalFB.valueLabel.text = country.capital?.first ?? ""
        populationFB.valueLabel.text = "\(country.population)"
    }
    
}
