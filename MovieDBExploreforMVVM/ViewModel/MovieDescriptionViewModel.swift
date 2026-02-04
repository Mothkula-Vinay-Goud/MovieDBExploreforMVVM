//
//  MovieDescriptionViewModel.swift
//  MovieDBExploreforMVVM
//
//  Created by Vinay Goud Mothkula on 2/3/26.
//

import Foundation
class MovieDescriptionViewModel{
    
    private var selectedMovie: MovieModel?
    
    init(selectedMovie: MovieModel) {
        self.selectedMovie = selectedMovie
    }
    
    func getTitle() -> String? {
        return selectedMovie?.title
    }
    func getScore() -> Double?{
        return selectedMovie?.score
    }
    func getYear() -> Int?{
        return selectedMovie?.year
    }
    func getImage() -> String? {
        return selectedMovie?.imageView
    }
    func getRating() -> String?{
        return selectedMovie?.rating
    }
    func getDescription() -> String? {
        return selectedMovie?.description
    }
   
}
