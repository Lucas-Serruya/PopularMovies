//
//  MovieCollectionViewCell.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/24/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import UIKit
import SDWebImage

class DashboardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    let posterImageRequiredResolution = "w342/"
    
    var movie: Movie? {
        didSet {
            if let moviePosterPath = movie?.moviePosterThumbnailPath {
                posterImage.sd_setImageWithURL(NSURL(string: DataSource.apiImagesBasePath + posterImageRequiredResolution + moviePosterPath))
            }
            if let title = movie?.title {
                self.title.text = title
            }
        }
    }
    
}
