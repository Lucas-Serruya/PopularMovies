//
//  NSDateExtension.swift
//  PopularMovies
//
//  Created by Lucas David Serruya on 4/29/16.
//  Copyright © 2016 Lucas David Serruya. All rights reserved.
//

import Foundation

extension NSDate {
     static func date(fromString stringDate: String, stringFormat:String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = stringFormat
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        
        if let date = dateFormatter.dateFromString(stringDate) {
            return date
        }
        return nil
    }
    
    func stringDate(format format:String) -> String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let timeStamp = dateFormatter.stringFromDate(self)
        return timeStamp
    }
}