//
//  Coordinator.swift
//  ShudderFeaturedPage
//
//  Created by Ilias Basha on 2/6/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
