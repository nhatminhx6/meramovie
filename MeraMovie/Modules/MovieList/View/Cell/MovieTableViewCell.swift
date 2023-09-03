//
//  MovieTableViewCell.swift
//  MeraMovie
//
//  Created by NhatMinh on 01/09/2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

   
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 6
        movieImage.layer.masksToBounds = true
        movieImage.clipsToBounds = true
        statusLabel.isHidden = true
    }
    
    func setupData(movie: MovieModel) {
        titelLabel.text     = movie.title + " (\(String(movie.getReleaseYear())))"
        genreLabel.text     = movie.genre
        durationLabel.text  = movie.duration
        movieImage.image    = movie.thumbnail
        statusLabel.isHidden = !AppUtils.checkMovieInWatchList(id: movie.id)
        
    }
    
}
