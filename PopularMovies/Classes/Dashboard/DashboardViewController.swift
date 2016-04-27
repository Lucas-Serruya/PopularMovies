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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMoviesCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupMoviesCollectionView() {
        setFlowLayout()
        automaticallyAdjustsScrollViewInsets = false
        moviesCollectionView.showsHorizontalScrollIndicator = false
        moviesCollectionView.showsVerticalScrollIndicator = false
        moviesCollectionView.backgroundColor = UIColor.whiteColor()
        moviesCollectionView?.delegate = self
        moviesCollectionView?.dataSource = self
    }
    
    private func setFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        let numberOfItemsPerRow: CGFloat = 2
        let spaceBetweenItems: CGFloat = 1
        let numberOfSpacesBetweenItems: CGFloat = 1
        let widthForItem = (view.frame.size.width - spaceBetweenItems*numberOfSpacesBetweenItems)/numberOfItemsPerRow
        let heightForItem = widthForItem * movieCellAspectRatio
        
        flowLayout.itemSize = CGSizeMake(widthForItem, heightForItem);
        flowLayout.minimumInteritemSpacing = spaceBetweenItems;
        flowLayout.minimumLineSpacing = spaceBetweenItems
        self.flowLayout = flowLayout
        moviesCollectionView.collectionViewLayout = flowLayout
    }


}
extension DashboardViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //must implement
    }
}

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        //must implement
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
//            cellAux.composition = Store<Composition>().objects[indexPath.row]
        }
        return cell
    }
    
}
