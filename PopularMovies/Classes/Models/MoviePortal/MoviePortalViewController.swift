//
//  MoviePortalViewController.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/27/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import UIKit
import SDWebImage

class MoviePortalViewController: UIViewController {
    
    @IBOutlet weak var playerThumbnailImageView: UIImageView!
    @IBOutlet weak var posterThumbnail: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    var movie: Movie!
    
    let thumbnailQuality = "w780/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie Detail"
        posterThumbnail.image = movie?.posterThumbnail
        if let title = movie?.title, let shortTitle = title.componentsSeparatedByString(":").first {
            titleLabel.text = shortTitle
        }
        dateLabel.text = convertDateFormater(movie?.releaseDate)
        if let rating = movie.rating {
            ratingLabel.text = "Average rating: " + String(format:"%.02f", rating)
        }
        overViewLabel.text = movie?.overView
        setPlayerLayer()
        if let posterPath = movie?.posterThumbnailPath {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MoviePortalViewController.didSetThumbnailPoster), name: NotificationKey.didSetThumbnailPoster + posterPath, object: nil)
        }
    }
    
    deinit {
        if let posterPath = movie?.posterThumbnailPath {
            NSNotificationCenter.defaultCenter().removeObserver(NotificationKey.didSetThumbnailPoster + posterPath)
        }
    }
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
    }
    
    func didSetThumbnailPoster() {
        posterThumbnail.image = movie?.posterThumbnail
    }
    
    //set trailer logic here
    func setPlayerLayer() {
        if let movieTrailerThumbnailPath = movie?.trailerThumbnailPath {
            let imageUrl = DataSource.apiImagesBasePath + thumbnailQuality + movieTrailerThumbnailPath
            playerThumbnailImageView.sd_setImageWithURL(NSURL(string:imageUrl), completed: { (image, error, cacheType, url) in
                if error == nil {
                }
            })
        }
    }
    
    func convertDateFormater(date: String?) -> String? {
        guard let date = date else {
            return ""
        }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        
        guard let dateData = dateFormatter.dateFromString(date) else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "MMMM yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let timeStamp = dateFormatter.stringFromDate(dateData)
        
        return timeStamp
    }
}