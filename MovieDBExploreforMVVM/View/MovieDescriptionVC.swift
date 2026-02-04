//
//  MovieDescriptionVC.swift
//  MovieDBExploreforMVVM
//
//  Created by Vinay Goud Mothkula on 2/3/26.
//


import UIKit

class MovieDescriptionVC: UIViewController {
    //    MARK: Property
    var customImageView2: UIImageView?
    var movieTitle2: UILabel?
    var moviePopularityScore2: UILabel?
    var movieReleaseYear: UILabel?
    var movieRating: UILabel?
    var movieDescription: UILabel?
    
    var objMovieDescriptionVM : MovieDescriptionViewModel?
    
    //  MARK: View LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        addSubviews()
        setupConstraints()
        configureData()
    }
    //  MARK: Attributes Added
    func setupUI() {
        movieTitle2 = UILabel()
        movieTitle2?.textAlignment = .center
        movieTitle2?.translatesAutoresizingMaskIntoConstraints = false

        moviePopularityScore2 = UILabel()
        moviePopularityScore2?.textAlignment = .center
        moviePopularityScore2?.translatesAutoresizingMaskIntoConstraints = false

        movieReleaseYear = UILabel()
        movieReleaseYear?.textAlignment = .center
        movieReleaseYear?.translatesAutoresizingMaskIntoConstraints = false

        movieRating = UILabel()
        movieRating?.textAlignment = .center
        movieRating?.translatesAutoresizingMaskIntoConstraints = false

        movieDescription = UILabel()
        movieDescription?.numberOfLines = 0
        movieDescription?.textAlignment = .center
        movieDescription?.translatesAutoresizingMaskIntoConstraints = false

        customImageView2 = UIImageView()
        customImageView2?.contentMode = .scaleAspectFit
        customImageView2?.translatesAutoresizingMaskIntoConstraints = false
    }
    //  MARK: Adding Subviews
    func addSubviews() {
        guard
            let movieTitle2 = movieTitle2,
            let moviePopularityScore2 = moviePopularityScore2,
            let movieReleaseYear = movieReleaseYear,
            let movieRating = movieRating,
            let movieDescription = movieDescription,
            let customImageView2 = customImageView2
        else { return }

        view.addSubview(customImageView2)
        view.addSubview(movieTitle2)
        view.addSubview(movieDescription)
        view.addSubview(moviePopularityScore2)
        view.addSubview(movieReleaseYear)
        view.addSubview(movieRating)
    }
    //  MARK: Adding Constraints
    func setupConstraints() {
        guard
            let movieTitle2 = movieTitle2,
            let moviePopularityScore2 = moviePopularityScore2,
            let movieReleaseYear = movieReleaseYear,
            let movieRating = movieRating,
            let movieDescription = movieDescription,
            let customImageView2 = customImageView2
        else { return }

        NSLayoutConstraint.activate([
            customImageView2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            customImageView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customImageView2.widthAnchor.constraint(equalToConstant: 150),
            customImageView2.heightAnchor.constraint(equalToConstant: 200),

            movieTitle2.topAnchor.constraint(equalTo: customImageView2.bottomAnchor, constant: 15),
            movieTitle2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieTitle2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            movieDescription.topAnchor.constraint(equalTo: movieTitle2.bottomAnchor, constant: 20),
            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            moviePopularityScore2.topAnchor.constraint(equalTo: movieDescription.bottomAnchor, constant: 20),
            moviePopularityScore2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            moviePopularityScore2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            movieReleaseYear.topAnchor.constraint(equalTo: moviePopularityScore2.bottomAnchor, constant: 20),
            movieReleaseYear.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieReleaseYear.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            movieRating.topAnchor.constraint(equalTo: movieReleaseYear.bottomAnchor, constant: 20),
            movieRating.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieRating.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    // Adding data to the properties
    func configureData() {
        guard let movieTitle = objMovieDescriptionVM?.getTitle(),let movieScore = objMovieDescriptionVM?.getScore(), let movieYear = objMovieDescriptionVM?.getYear(),let  movieRate = objMovieDescriptionVM?.getRating(),let movieDesc = objMovieDescriptionVM?.getDescription(),let movieImageView = objMovieDescriptionVM?.getImage() else { return }

        movieTitle2?.text = movieTitle
        moviePopularityScore2?.text = "Popularity Score: \(movieScore)"
        movieReleaseYear?.text = "Release Year: \(movieYear)"
        movieRating?.text = "Rating: \(movieRate)"
        movieDescription?.text = movieDesc
        customImageView2?.image = UIImage(named: movieImageView)
    }

    
}


