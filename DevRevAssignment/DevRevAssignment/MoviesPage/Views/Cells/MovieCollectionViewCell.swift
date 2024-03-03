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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.movieImageView.layer.cornerRadius = 5
        self.movieImageView.layer.borderWidth = 1
        self.movieImageView.layer.borderColor = UIColor.white.cgColor
    }
    
    func configure(with movie: Movie) {
       // movieImageView.loadImage(fromURL: movie.posterPath)
        movieImageView.image = UIImage(named: "Movie1")
        movieTitleLabel.text = movie.title
    }
}

