//
//  CycleModel.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/25.
//

import UIKit

class CycleModel: NSObject {
    //1. 标题
    var title : String = ""
    //2. 图片地址
    var pic_url : String = ""
    //3.主播对应的字典
    var room : [String : NSObject]? {
        didSet {
            guard let room = room else { return }
            anchor = AnchorModel(dict: room)
        }
    }
    //4.主播信息对应的模型对象
    var anchor : AnchorModel?

    //MARK: 自定义构造函数
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
