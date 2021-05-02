//
//  BaseGameModel.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/25.
//

import UIKit

class BaseGameModel: NSObject {
    // MARK:- 定义属性
    @objc var tag_name : String = ""
    @objc var icon_url : String = ""
    
    // MARK:- 自定义构造函数
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
