//
//  AncharGroup.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/19.
//

import UIKit

class AnchorGroup: BaseGameModel {
    /// 该组中对应的房间信息
    var room_list : [[String : NSObject]]? {
        didSet {
            guard let room_list = room_list else { return }
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    /// 组显示的图标
    var icon_name : String = "home_header_normal"
    /// 定义主播的模型对象数组
    lazy var anchors : [AnchorModel] = [AnchorModel]()
}




















/*
 import UIKit

class AncharGroup: NSObject {
    //该组中对应的房间信息
    var room_list : [[String : NSObject]]? {
        didSet{
            guard let room_list = room_list else { return }
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    //显示组中的标题
    var tag_name : String = ""
    //组显示的图标
    var icon_name : String = "bottom_tabbar_mainhome_selected_22x22_"
    
    var tag_id : String = ""
    //定义主播模型的数组
    lazy var anchors : [AnchorModel] = [AnchorModel]()
    //MARK: 构造函数
    override init() {
        
    }
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
   //防止未解析数据报错
    override func setValue(_ value: Any?, forUndefinedKey key: String) {  }
    
    /*
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "room_list" {
            if let dataAraay = value as? [[String: NSObject]] {
                for dict in dataAraay {
                    anchors.append(AnchorModel(dict: dict))
                }
            }
        }
    }*/
}
*/
