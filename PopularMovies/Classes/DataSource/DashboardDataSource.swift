//
//  DashboardDataSource.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/25/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import Foundation

class DashboardDataSource {
    var currentPage = 0
    //todo: make pagination
    func needMoreMovies(completionHandler:([Movie])->()) {
        DataSource.sharedInstance.getPopularMovies(page: currentPage, completionHandler: completionHandler) { 
        }
    }
}