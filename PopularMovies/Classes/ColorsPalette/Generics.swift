//
//  Generics.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/28/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import UIKit

func value<T>(iPad iPad:T, iPhone:T) -> T {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
        return iPad
    } else {
        return iPhone
    }
}

struct NotificationKey {
    static let didSetThumbnailPoster  = "didSetThumbnailPoster"
}
