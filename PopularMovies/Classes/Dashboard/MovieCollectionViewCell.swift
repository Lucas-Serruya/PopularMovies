//
//  MovieCollectionViewCell.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/24/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import UIKit
import SDWebImage
import ChameleonFramework

class DashboardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detailContainer: UIView!
    
    let posterImageRequiredResolutionForIphone = "w342/"
    let posterImageRequiredResolutionForIpad = "w500/"
    
    var movie: Movie? {
        didSet {
            if let moviePosterPath = movie?.posterThumbnailPath {
                let imageUrl = DataSource.apiImagesBasePath + value(iPad: posterImageRequiredResolutionForIpad, iPhone: posterImageRequiredResolutionForIphone) + moviePosterPath
                posterImage.sd_setImageWithURL(NSURL(string:imageUrl), completed: { (image, error, cacheType, url) in
                    if error == nil {
                        self.detailContainer.backgroundColor = AverageColorFromImage(image)
                        self.movie?.posterThumbnail = image
                        NSNotificationCenter.defaultCenter().postNotificationName(NotificationKey.didSetThumbnailPoster + moviePosterPath, object: nil)
                    }
                })
            }
            if let title = movie?.title {
                let shortTitle = title.componentsSeparatedByString(":").first
                self.title.text = shortTitle
            }
        }
    }
    
}
