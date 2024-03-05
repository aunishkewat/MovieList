//
//  CastCollectionViewCell.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 04/03/24.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var actorImageView: UIImageView!
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var backgroundShadowView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }
    
    private func setupUI() {

        backgroundShadowView.layer.cornerRadius = 10
        backgroundShadowView.layer.shadowColor = UIColor.black.cgColor
        backgroundShadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        backgroundShadowView.layer.shadowRadius = 4
        backgroundShadowView.layer.shadowOpacity = 0.25
        
        actorNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        characterNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    

    func configure(with castMember: CastMember) {
        actorNameLabel.text = castMember.name
        characterNameLabel.text = castMember.character
        
        if let profilePath = castMember.profilePath {
            let fullImageUrlString = "https://image.tmdb.org/t/p/w500\(profilePath)"
            self.actorImageView.loadImage(fromURL: fullImageUrlString)
        } else {
            actorImageView.image = UIImage(systemName: "person.circle.fill")
        }
    }
}
