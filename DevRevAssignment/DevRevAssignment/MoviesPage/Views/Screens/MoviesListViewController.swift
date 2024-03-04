//
//  MoviesListViewController.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 03/03/24.
//

import UIKit
//import CustomNetwork

class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie] = []
    let viewModel = MovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.setupColletionRegister()
        self.fetchMovies(forSegment: segmentedControl.selectedSegmentIndex)
        self.setupUISegment()
    }
    
    func setupColletionRegister() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register the cell with the collection view
        collectionView.register(MovieCollectionViewCell.nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
        
    func setupUISegment() {
        // Customization
           segmentedControl.backgroundColor = .clear
           segmentedControl.selectedSegmentTintColor = UIColor.systemTeal

           // Add rounded corners
           segmentedControl.layer.cornerRadius = segmentedControl.bounds.height / 2
           segmentedControl.layer.borderColor = UIColor.systemTeal.cgColor
           segmentedControl.layer.borderWidth = 1
           segmentedControl.layer.masksToBounds = true
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        fetchMovies(forSegment: sender.selectedSegmentIndex)
    }
    
    private func fetchMovies(forSegment segment: Int) {
        // Depending on the segment, fetching the latest or popular movies
        movies = []
        
        if segment == 0 {
            viewModel.fetchPopularMovies(endPoint: Constants.Endpoints.nowPlaying) { success, error in
                if success {
                    // Refresh UI with viewModel.movies
                    self.movies = self.viewModel.movies
                    print(self.movies.count)
                    DispatchQueue.main.async {
                        // Update your UI here
                        self.collectionView.reloadData()
                    }
                } else {
                    // Handle error
                    print(error?.localizedDescription ?? "Unknown error")
                }
            }
        } else {
            viewModel.fetchPopularMovies(endPoint: Constants.Endpoints.popular) { success, error in
                if success {
                    // Refresh UI with viewModel.movies
                    self.movies = self.viewModel.movies
                    print(self.movies.count)
                    DispatchQueue.main.async {
                        // Update your UI here
                        self.collectionView.reloadData()
                    }
                } else {
                    // Handle error
                    print(error?.localizedDescription ?? "Unknown error")
                }
            }
        }
    }
}

//MARK: - ColletionView Movie Delegates

extension MoviesListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle cell selection
        let movieDetails = MovieDetailViewController()
        movieDetails.movieId = movies[indexPath.row].id
        navigateToNextViewController(controller: movieDetails)
    }
}

extension MoviesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let totalSpacing = spacing * 2
        let insets = collectionView.contentInset.left + collectionView.contentInset.right
        
        let width = (collectionView.frame.width - totalSpacing - insets) / 3
        let height = width * 2.5
        
        return CGSize(width: width, height: height)
    }
}

