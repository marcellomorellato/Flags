//
//  CountriesTVCell.swift
//  Flags
//
//  Created by Marcello on 19/10/22.
//

import Foundation
import UIKit

class CountriesTVCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    var imageURL: URL? {
        didSet {
            self.updateFlagImage()
        }
    }
    
    @IBOutlet weak var flagImageView: UIImageView!
    
    private func updateFlagImage() {
        Task {
            let image = try? await fetchImage()
            flagImageView.image = image
        }
    }
    
    private func fetchImage() async throws -> UIImage? {
        guard let url = self.imageURL else {
            throw ImageError.invalidUrl
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return UIImage(data: data)
        } catch {
            throw error
        }
    }
    

    
}
