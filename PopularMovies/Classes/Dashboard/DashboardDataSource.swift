//
//  DashboardDataSource.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/25/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import Foundation
import Alamofire

class DashboardDataSource : DataSource {
    
    //todo: make pagination
    func getPopularMovies(completionHandler:([Movie])->(), errorHandler:(()->())?) {
        Alamofire.request(.GET, DataSource.apiBaseUrl + DataSource.popularMoviesEndpoint, parameters: ["api_key":DataSource.apiKey]).responseJSON { (response) in
            var moviesArray = [Movie]()
            if let responseDictionary = response.result.value as? Dictionary<String,AnyObject>,  let responseArray = responseDictionary["results"] as? [AnyObject] {
                for movie in responseArray {
                    let movie = Movie(fromDictionary: movie)
                    if (movie.id) != nil {
                        moviesArray.append(movie)
                    }
                }
                completionHandler(moviesArray)
            }
        }
    }
}