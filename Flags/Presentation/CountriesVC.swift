//
//  ViewController.swift
//  Flags
//
//  Created by Marcello on 17/10/22.
//

import UIKit
import Combine

class CountriesVC: BaseVC {
    var viewModel = CountriesVM()
    @IBOutlet weak var mainTableView: UITableView!
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Task {
            await self.viewModel.fetchData()
        }
    }
    
    func setup(){
        viewModel.$countries.receive(on: DispatchQueue.main)
            .sink { [weak self] countries in
            self?.mainTableView.reloadData()
        }.store(in: &subscriptions)
    }

}

//MARK: tableView
extension CountriesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTVCell", for: indexPath) as! CountriesTVCell

        guard let country = self.viewModel.countries?[indexPath.row] as? Country
        else { return UITableViewCell() }
        
        cell.imageURL = country.flagImageURL()
        cell.titleLabel.text = country.name.common
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let country = self.viewModel.countries?[indexPath.row] as? Country else {
            return
        }
        
        
    }
    
}

