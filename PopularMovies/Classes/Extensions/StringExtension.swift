//
//  StringExtension.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/29/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import Foundation

extension String {
    func returnStringDateWithFormat(currentFormat currentFormat:String, dateRequiredFormat:String) -> String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = currentFormat
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        
        guard let dateData = dateFormatter.dateFromString(self) else {
            return ""
        }
        
        dateFormatter.dateFormat = dateRequiredFormat
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let timeStamp = dateFormatter.stringFromDate(dateData)
        return timeStamp
    }
}
