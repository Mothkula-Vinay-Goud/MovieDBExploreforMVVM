//ViewModel -- businessLogic
//  MovieFirstPageCell.swift
//  MovieDBExploreforMVVM
//
//  Created by Vinay Goud Mothkula on 2/3/26.
//

import UIKit

class MovieFirstPageCell: UITableViewCell {
    //    MARK: Property
    var customImageView: UIImageView?
    var movieTitle: UILabel?
    var moviePopularityScore: UILabel?
    var movieReleaseYear: UILabel?
    var movieRating: UILabel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        movieTitle = UILabel()
        moviePopularityScore = UILabel()
        movieReleaseYear = UILabel()
        customImageView = UIImageView()
        movieRating = UILabel()
        addingAttributes()
        addSubviewConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Attributes
    func addingAttributes(){
        movieTitle?.textColor = .green
        movieTitle?.translatesAutoresizingMaskIntoConstraints = false
        moviePopularityScore?.textColor = .black
        moviePopularityScore?.translatesAutoresizingMaskIntoConstraints = false
        movieReleaseYear?.textColor = .black
        movieReleaseYear?.translatesAutoresizingMaskIntoConstraints = false
        customImageView?.translatesAutoresizingMaskIntoConstraints = false
        movieRating?.textColor = .black
        movieRating?.translatesAutoresizingMaskIntoConstraints = false
    }
    //  MARK: Adding Subviews and Constraints
    func addSubviewConstraints(){
        if let movieTitle = movieTitle, let moviePopularityScore = moviePopularityScore, let movieReleaseYear = movieReleaseYear, let customImageView = customImageView, let movieRating = movieRating {
            contentView.addSubview(movieTitle)
            contentView.addSubview(moviePopularityScore)
            contentView.addSubview(movieReleaseYear)
            contentView.addSubview(customImageView)
            contentView.addSubview(movieRating)
            
            NSLayoutConstraint.activate([
                customImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
                customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                customImageView.trailingAnchor.constraint(equalTo: movieTitle.leadingAnchor, constant: -10),
                customImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
                customImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                customImageView.widthAnchor.constraint(equalToConstant: 120),
                customImageView.heightAnchor.constraint(equalToConstant: 150),
    
                movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                movieTitle.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10),
                movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                
                moviePopularityScore.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 15),
                moviePopularityScore.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10),
                moviePopularityScore.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                
                movieReleaseYear.topAnchor.constraint(equalTo: moviePopularityScore.bottomAnchor, constant: 15),
                movieReleaseYear.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10),
                movieReleaseYear.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                
                movieRating.topAnchor.constraint(equalTo: movieReleaseYear.bottomAnchor, constant: 15),
                movieRating.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10),
                movieRating.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            ])
        }
        
    }
    //adding data to the properties
    func setData(movieModel:MovieModel){
        movieTitle?.text = "Title : \(movieModel.title)"
        moviePopularityScore?.text = "Popularity Score : \(movieModel.score)"
       movieReleaseYear?.text =   "Release Year : \(movieModel.year)"
        movieRating?.text = "Rating : \(movieModel.rating)"
        customImageView?.image = UIImage(named: "\(movieModel.imageView)")
    }
}


