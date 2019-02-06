//
//  FeaturedCoordinator.swift
//  ShudderFeaturedPage
//
//  Created by Ilias Basha on 2/6/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation
import UIKit

class FeaturedCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = FeaturedViewController.instantiate()
        navigationController.pushViewController(viewController, animated: false)
    }
    
    
}
