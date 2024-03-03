//
//  MoviesListViewController.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 03/03/24.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.setupColletionRegister()
        self.fetchMovies(forSegment: segmentedControl.selectedSegmentIndex)
        self.setupUISegment()
        self.demoMovie()
    }
    
    func setupColletionRegister() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register the cell with the collection view
        collectionView.register(MovieCollectionViewCell.nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
    
    func demoMovie() {
        movies = [
            Movie(id: 1, title: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", releaseDate: "1994-09-23", posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", voteAverage: 8.7),
            Movie(id: 2, title: "The Godfather", overview: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", releaseDate: "1972-03-14", posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg", voteAverage: 8.6),
            Movie(id: 3, title: "The Dark Knight", overview: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", releaseDate: "2008-07-16", posterPath: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg", voteAverage: 8.4),
            Movie(id: 4, title: "12 Angry Men", overview: "A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.", releaseDate: "1957-04-10", posterPath: "/ppd84D2i9W8jXmsyInGyihiSyqz.jpg", voteAverage: 8.9),
            Movie(id: 5, title: "Schindler's List", overview: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.", releaseDate: "1993-12-15", posterPath: "/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg", voteAverage: 8.9),
            Movie(id: 1, title: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", releaseDate: "1994-09-23", posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", voteAverage: 8.7),
            Movie(id: 1, title: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", releaseDate: "1994-09-23", posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", voteAverage: 8.7),
            Movie(id: 1, title: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", releaseDate: "1994-09-23", posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", voteAverage: 8.7),
            Movie(id: 1, title: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", releaseDate: "1994-09-23", posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", voteAverage: 8.7),
            Movie(id: 1, title: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", releaseDate: "1994-09-23", posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", voteAverage: 8.7)
        ]

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
        //movies = []
        collectionView.reloadData()
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

