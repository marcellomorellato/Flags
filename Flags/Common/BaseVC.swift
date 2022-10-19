//
//  BaseVC.swift
//  Flags
//
//  Created by Marcello on 19/10/22.
//

import Foundation
import UIKit

class BaseVC: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup(){
    
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
    }
    
}
