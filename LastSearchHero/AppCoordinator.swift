//
//  AppCoordinator.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    func start() {
        let coordinator = AlbumSearchCoordinator(navigationController: navigationController)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
   
    func albumSearchCoordinatorCompleted(coordinator: AlbumSearchCoordinator) {
        // do some stuff before releasing
        if let index = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}

