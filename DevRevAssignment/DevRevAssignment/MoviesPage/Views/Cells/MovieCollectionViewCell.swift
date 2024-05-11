//
//  MovieCollectionViewCell.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 03/03/24.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.movieImageView.layer.cornerRadius = 5
        self.movieImageView.layer.borderWidth = 1
        self.movieImageView.layer.borderColor = UIColor.white.cgColor
    }
    
    func configure(with movie: Movie) {
        guard let posterPath = movie.posterPath else { return }
        let imageSize = "w500"
        let baseURL = "https://image.tmdb.org/t/p/"

        let fullPosterURL = baseURL + imageSize + posterPath
        
        movieImageView.loadImage(fromURL: fullPosterURL)
        movieTitleLabel.text = movie.title
        movieDateLabel.text = movie.releaseDate
    }
}

