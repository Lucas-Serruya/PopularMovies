//
//  DataSource.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/25/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import Alamofire

class DataSource {
    
    static let sharedInstance = DataSource()
    
    let apiKey = "ce26a4b91c4a8d18b3eb75c97dbf058a"
    let apiBaseUrl = "https://api.themoviedb.org/3/movie/"
    let popularMoviesEndpoint = "popular"
    
    //todo: make generic get
    func getPopularMovies(page page:Int, completionHandler:([Movie])->(), errorHandler:()->()) {
        Alamofire.request(.GET, apiBaseUrl + popularMoviesEndpoint, parameters: ["api_key":apiKey]).responseJSON { (response) in
            var moviesArray = [Movie]()
            if let responseDictionary = response.result.value as? Dictionary<String,AnyObject> {
                if let responseArray = responseDictionary["results"] as? [AnyObject] {
                    for movie in responseArray {
                        let movie = Movie(fromDictionary: movie)
                        if (movie.id) != nil {
                            moviesArray.append(Movie(fromDictionary: movie))
                        }
                    }
                    completionHandler(moviesArray)
                }
            }
        }
    }
}