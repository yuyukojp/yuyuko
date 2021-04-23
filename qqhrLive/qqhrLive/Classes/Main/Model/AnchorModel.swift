//
//  AnchorModel.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/19.
//

import UIKit

class AnchorModel: NSObject {
    //房间ID
    var room_id : Int = 0
    //房间图片URL
    var vertical_src : String = ""
    //判断播放设备0是电脑1是手机
    var isVertical : Int = 0
    //房间名字
    var room_name : String = ""
    //主播昵称
    var nickname : String = ""
    //在线观看人数
    var online : Int = 0
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override class func setValue(_ value: Any?, forUndefinedKey key: String) {  }
}
