//
//  MovieListCell.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation
import UIKit

class MovieListCell: UITableViewCell {
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configureWithMovie(_ movie: MovieWithPoster) {
        self.titleLabel.text = movie.movie.title
        self.descriptionLabel.text = movie.movie.overview
        self.moviePosterImageView.image = movie.poster
        
    }
    
    func configureWithPoster(_ poster: UIImage) {
        self.moviePosterImageView.image = poster
    }
}
