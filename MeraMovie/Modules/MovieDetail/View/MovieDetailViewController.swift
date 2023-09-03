//
//  MovieDetailViewController.swift
//  MeraMovie
//
//  Created by NhatMinh on 31/08/2023.
//

import UIKit
import Foundation

class MovieDetailViewController: UIViewController {

    var viewModel: MovieDetailViewModel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var btnAddWatchList: UIButton!
    @IBOutlet weak var btnWatchTrailer: UIButton!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    
    
    @IBAction func btnAddWatchListAction(_ sender: Any) {
        // Avoid user press the button too much in a time
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            self.viewModel.addOrRemoveToWatchList()
        }
       
    }
    
    @IBAction func btnWatchTrailerAction(_ sender: Any) {
        if let url = URL(string: self.viewModel.data.trailerUrl) {
            UIApplication.shared.open(url)
        } else {
            print("can not open the trailer")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.bindUI()
        self.viewModel.viewDidLoad()
        
    }
    
    private func setupUI() {
        movieImage.layer.cornerRadius = 8
        movieImage.clipsToBounds = true
        
        btnAddWatchList.backgroundColor = .systemGray5
        btnAddWatchList.layer.cornerRadius = btnAddWatchList.frame.height / 2
        
        btnWatchTrailer.layer.cornerRadius = btnWatchTrailer.frame.height / 2
        btnWatchTrailer.layer.borderColor = UIColor.black.cgColor
        btnWatchTrailer.layer.borderWidth = 1
    }

    private func bindUI(){
        self.viewModel.showData = { [weak self] (data, status) in
            guard let `self` = self else { return }
            self.movieImage.image = data.thumbnail
            self.titleLabel.text = data.title
            self.ratingLabel.text = String(data.rating)
            self.descLabel.text = data.description
            self.genreLabel.text = data.genre
            self.releaseLabel.text = data.releasedDate
        }
        
        self.viewModel.stausChanged = { [weak self] (status) in
            self?.handleWatchListButton(isOnWatchList: status)
        }
    }
    
    private func handleWatchListButton(isOnWatchList: Bool) {
        if isOnWatchList {
            self.btnAddWatchList.setTitle("REMOVE FROM WATCHLIST", for: .normal)
        } else {
            self.btnAddWatchList.setTitle("+ ADD TO WATCHLIST", for: .normal)
        }
    }

}

