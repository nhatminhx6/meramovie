//
//  AppCoordinator.swift
//  MeraMovie
//
//  Created by NhatMinh on 31/08/2023.
//

import UIKit
import Foundation

class AppCoordinator: BaseCoordinator {
    // MARK: - Properties
    let window: UIWindow?
    lazy var dataStore : MovieDataStore = {
        return MovieDataStoreImp()
    }()
    
    var movieListCoordinator : MovieListCoordinator!
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    @discardableResult
    func start()->UIViewController{
        self.movieListCoordinator = MovieListCoordinator(dataStore: dataStore)
        let mainVC = self.movieListCoordinator.start()
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
        return mainVC
    }

}
