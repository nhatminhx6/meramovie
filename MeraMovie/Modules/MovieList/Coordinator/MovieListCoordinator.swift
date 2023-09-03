//
//  MovieListCoordinatorDelegate.swift
//  MeraMovie
//
//  Created by NhatMinh on 31/08/2023.
//

import Foundation
import UIKit


final class MovieListCoordinator: BaseCoordinator {
    
    var rootViewController: UINavigationController!
    var dataStore : MovieDataStore
    
    var movieDetailViewCoordinator : MovieDetailViewCoordinator!
    
    init(dataStore : MovieDataStore) {
        self.dataStore = dataStore
    }
    
    func start()-> UIViewController{
        let service = MovieServiceImp(dataStore: self.dataStore)
        let viewModel = MovieListViewModelImp(service: service)
        viewModel.coordinatorDelegate = self
        let listVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        self.rootViewController = UINavigationController(rootViewController: listVC)
        self.rootViewController.navigationBar.tintColor = UIColor.black
        listVC.viewModel = viewModel
        return rootViewController
    }
    
}

extension MovieListCoordinator: MovieListViewModelCoordinatorDelegate {
    func didTapOnMovie(movieData: MovieModel) {
        movieDetailViewCoordinator = MovieDetailViewCoordinator(data: movieData)
        let detailVC = movieDetailViewCoordinator.start()
        self.rootViewController.pushViewController(detailVC, animated: true)
        
    }
}
