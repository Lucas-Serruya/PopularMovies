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
    
    let thumbnailQualityForIphone = "w780/"
    let thumbnailQualityForIpad = "w1280/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie Detail"
        
        posterThumbnail.image = movie?.posterThumbnail
        if let title = movie?.title, let shortTitle = title.componentsSeparatedByString(":").first {
            titleLabel.text = shortTitle
        }
        dateLabel.text = movie?.releaseDate?.returnStringDateWithFormat(currentFormat: "yyyy-MM-dd", dateRequiredFormat: "MMMM yyyy")
        if let rating = movie.rating {
            ratingLabel.text = "Average rating: " + String(format:"%.02f", rating)
        }
        overViewLabel.text = movie?.overView
        loadMovieTrailer()
        
        if let posterPath = movie?.posterThumbnailPath {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MoviePortalViewController.didSetThumbnailPoster), name: NotificationKey.didSetThumbnailPoster + posterPath, object: nil)
        }
    }
    
    deinit {
        if let posterPath = movie?.posterThumbnailPath {
            NSNotificationCenter.defaultCenter().removeObserver(NotificationKey.didSetThumbnailPoster + posterPath)
        }
    }
    
    func didSetThumbnailPoster() {
        posterThumbnail.image = movie?.posterThumbnail
    }
    
    //set trailer logic here
    func loadMovieTrailer() {
        if let movieTrailerThumbnailPath = movie?.trailerThumbnailPath {
            let imageUrl = DataSource.apiImagesBasePath + value(iPad: thumbnailQualityForIpad, iPhone: thumbnailQualityForIphone) + movieTrailerThumbnailPath
            playerThumbnailImageView.sd_setImageWithURL(NSURL(string:imageUrl))
        }
    }
}