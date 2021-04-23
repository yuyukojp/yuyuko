//
//  NSDate-Extension.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/19.
//

import Foundation


extension NSDate {
    class func getCurrentTime() -> String {
        let nowDate = NSDate()
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
