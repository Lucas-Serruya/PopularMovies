//
//  Movie.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/25/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import UIKit

class Movie {
    
    var id: Int! //id
    var title: String? //original_title
    var moviePosterThumbnailPath: String? //var poster_path
    var trailerThumbnailPath: String? // backdrop_path
    var overView: String? //overview
    var rating: Float? //vote_average
    var releaseDate: String? //release_date
    
    init(fromDictionary dictionary: AnyObject) {
        guard let id = dictionary["id"] as? Int else {
            return
        }
        self.id = id
        title = dictionary["original_title"] as? String
        moviePosterThumbnailPath = dictionary["poster_path"] as? String
        trailerThumbnailPath = dictionary["backdrop_path"] as? String
        overView = dictionary["overview"] as? String
        rating = dictionary["vote_average"] as? Float
        releaseDate = dictionary["release_date"] as? String
    }
}