//
//  DashboardViewController.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/23/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var flowLayout = UICollectionViewFlowLayout()
    let movieCellAspectRatio: CGFloat = 1.7777777778 //9:16 aspect ratio
    let movieCellIdentifier = "MovieCollectionItemIdentifier"
    var movies: [Movie] = Array()
    var dataSource = DashboardDataSource()
    var activityIndicator: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        
        setupMoviesCollectionView()
        setLoadingView()
        
        showLoading()
        dataSource.getPopularMovies({ (movies) in
            self.movies = movies
            self.moviesCollectionView.reloadData()
            self.hideLoading()
        }, errorHandler: nil)
        
        setStatusBarColor(ColorsPalette.statusBarColor)
        navigationController?.navigationBar.barTintColor = ColorsPalette.navBarBgColor
    }
    
    func setLoadingView() {
        let window = UIApplication.sharedApplication().delegate?.window
        activityIndicator = UIView(frame:UIScreen.mainScreen().bounds)
        let activityWheel = UIActivityIndicatorView()
        activityWheel.frame = activityIndicator.frame
        activityWheel.startAnimating()
        activityIndicator.addSubview(activityWheel)
        activityIndicator.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        if let window = window {
            window!.addSubview(activityIndicator)
        }
        activityIndicator.alpha = 0
    }

    func showLoading() {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.activityIndicator.alpha = 1
        }
    }
    
    func hideLoading() {
        UIView.animateWithDuration(0.1) { () -> Void in
            self.activityIndicator.alpha = 0
        }
    }

    func setupMoviesCollectionView() {
        setFlowLayout()
        moviesCollectionView?.dataSource = self
        moviesCollectionView.backgroundColor = UIColor.whiteColor()
        moviesCollectionView.showsHorizontalScrollIndicator = false
        moviesCollectionView.showsVerticalScrollIndicator = false
        automaticallyAdjustsScrollViewInsets = false
    }
    
    private func setFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        let numberOfItemsPerRow: CGFloat = value(iPad: 4, iPhone: 2)
        let numberOfSpacesBetweenItems = numberOfItemsPerRow - 1
        let spaceBetweenItems: CGFloat = 1
        let widthForItem = (view.frame.size.width - spaceBetweenItems*numberOfSpacesBetweenItems)/numberOfItemsPerRow
        let heightForItem = widthForItem * movieCellAspectRatio
        
        flowLayout.itemSize = CGSizeMake(widthForItem, heightForItem);
        flowLayout.minimumInteritemSpacing = spaceBetweenItems;
        flowLayout.minimumLineSpacing = spaceBetweenItems
        self.flowLayout = flowLayout
        moviesCollectionView.collectionViewLayout = flowLayout
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let moviePortalController = segue.destinationViewController as? MoviePortalViewController {
            if let cell = sender as? UICollectionViewCell, let indexPath = moviesCollectionView.indexPathForCell(cell) {
                moviePortalController.movie = movies[indexPath.row]
            }
        }
    }
}

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return flowLayout.itemSize
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(movieCellIdentifier, forIndexPath: indexPath)
        if let cellAux = cell as? DashboardCollectionViewCell {
            cellAux.movie = movies[indexPath.row]
        }
        return cell
    }
    
}
