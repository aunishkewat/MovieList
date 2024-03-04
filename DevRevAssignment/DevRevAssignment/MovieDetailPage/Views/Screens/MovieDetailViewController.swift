//
//  MovieDetailViewController.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 04/03/24.
//

import UIKit

class MovieDetailViewController: UIViewController {

    // Add IBOutlet properties to connect with your UI components in Interface Builder
    //navigation header
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var movieTitleLabel: UILabel!

    //movie summary
    @IBOutlet weak var movieBgPoster: UIImageView!
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitleNameLabel: UILabel!
    @IBOutlet weak var movieSubTitleDetailsLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var overViewDetailLabel: UILabel!
    @IBOutlet weak var castsCollectionView: UICollectionView!
    
    @IBOutlet weak var movieCastLabel: UILabel!
    
    var viewModel = MovieDetailViewModel()
    var movieId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        getMovieDetails()
        getCastDetails()
    }

    private func configureUI() {

        self.movieTitleLabel.text = "Movie Title"
        
        self.movieTitleNameLabel.textColor = .white
        
        self.movieSubTitleDetailsLabel.textColor = .white
        
        self.overViewLabel.text = "Overview"
        self.overViewLabel.textColor = .black
        self.overViewLabel.font = .systemFont(ofSize: 20, weight: .bold)
        self.overViewDetailLabel.textColor = .black

        
        self.moviePosterImage.layer.cornerRadius = 5
        
        self.backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        self.backButton.tintColor = .black
        
        self.movieCastLabel.text = "Top Billed Cast"
        self.movieCastLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        //colletion view registration
        castsCollectionView.delegate = self
        castsCollectionView.dataSource = self
        
        // Register the cell with the collection view
        castsCollectionView.register(CastCollectionViewCell.nib, forCellWithReuseIdentifier: CastCollectionViewCell.identifier)
    }
    
    func getMovieDetails() {
        viewModel.fetchMovieDetails(movieId: movieId) { success, error in
            if success {
                DispatchQueue.main.async {

                    self.movieTitleLabel.text = self.viewModel.movieDetail?.originalTitle
                    
                    self.movieTitleNameLabel.text = self.viewModel.movieDetail?.originalTitle
                    self.movieSubTitleDetailsLabel.text = (self.viewModel.movieDetail?.releaseDate ?? "") + " \u{2022} "
                    self.overViewDetailLabel.text = self.viewModel.movieDetail?.overview
                    
                    let backdropPath = self.viewModel.movieDetail?.backdropPath ?? ""
                    let posterPath = self.viewModel.movieDetail?.posterPath ?? ""
                    let imageSize = "w500"
                    let baseURL = "https://image.tmdb.org/t/p/"

                    let fullBackdropPosterURL = baseURL + imageSize + backdropPath
                    let fullPosterUrl = baseURL + imageSize + posterPath
                    
                    self.movieBgPoster.loadImage(fromURL: fullBackdropPosterURL)
                    self.moviePosterImage.loadImage(fromURL: fullPosterUrl)
                }
            } else {
                // Handle error
                print(error?.localizedDescription ?? "An error occurred")
            }
        }
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigateToBackViewController()
    }
}

//MARK: - Get cast
extension MovieDetailViewController {
    func getCastDetails() {
        self.viewModel.fetchMovieCast(movieId: movieId) { success, error in
            if success {
                DispatchQueue.main.async {
                    self.castsCollectionView.reloadData()
                }
            } else {
                // Handle error
                print(error?.localizedDescription ?? "An error occurred")
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MovieDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movieCast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.identifier, for: indexPath) as? CastCollectionViewCell else {
            fatalError("Unable to dequeue CastCollectionViewCell")
        }
        
        let castMember = viewModel.movieCast[indexPath.row]
        cell.configure(with: castMember)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MovieDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the size of the collection view cell
        return CGSize(width: 180, height: 300)
    }
}
