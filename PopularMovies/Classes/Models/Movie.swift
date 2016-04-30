//
//  Movie.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/25/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import UIKit

class Movie {
    var id: Int!
    var title: String?
    var posterThumbnailPath: String?
    var posterThumbnail: UIImage?
    var trailerThumbnailPath: String?
    var overView: String?
    var rating: Float?
    var releaseDate: NSDate?
    
    init(fromDictionary dictionary: AnyObject) {
        let apiStringFormat = "yyyy-MM-dd"
        guard let id = dictionary["id"] as? Int else {
            return
        }
        self.id = id
        title = dictionary["original_title"] as? String
        posterThumbnailPath = dictionary["poster_path"] as? String
        trailerThumbnailPath = dictionary["backdrop_path"] as? String
        overView = dictionary["overview"] as? String
        rating = dictionary["vote_average"] as? Float
        if let dateString = dictionary["release_date"] as? String {
            releaseDate = NSDate.date(fromString: dateString, stringFormat: apiStringFormat)
        }
    }
}