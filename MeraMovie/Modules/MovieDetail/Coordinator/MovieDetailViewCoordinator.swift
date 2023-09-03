//
//  MovieDetailViewCoordinator.swift
//  MeraMovie
//
//  Created by NhatMinh on 02/09/2023.
//

import Foundation
import UIKit


class MovieDetailViewCoordinator : BaseCoordinator{
    
    let data: MovieModel
    init(data : MovieModel) {
        self.data = data
    }
    
    func start()-> UIViewController{
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        let viewModel = MovieDetailViewModelImp(data: self.data)
        detailVC.viewModel = viewModel
        return detailVC
    }

}

