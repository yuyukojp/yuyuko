//
//  AncharGroup.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/19.
//



import UIKit

class AnchorModel: NSObject {
    /// 房间ID
    @objc var room_id : Int = 0
    /// 房间图片对应的URLString
    @objc var vertical_src : String = ""
    /// 判断是手机直播还是电脑直播
    // 0 : 电脑直播(普通房间) 1 : 手机直播(秀场房间)
    @objc var isVertical : Int = 0
    /// 房间名称
    @objc var room_name : String = ""
    /// 主播昵称
    @objc var nickname : String = ""
    /// 观看人数
    @objc var online : Int = 0
    /// 所在城市
    @objc var anchor_city : String = ""
    //视频播放地址
    @objc var video_url : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        
     setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
