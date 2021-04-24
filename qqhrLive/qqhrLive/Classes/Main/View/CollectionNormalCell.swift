//
//  CollectionNormalCell.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/18.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {

    //MARK: 设置控件属性

    @IBOutlet weak var roomNameLabel: UILabel!
    
    
    
   override var anchor : AnchorModel? {
        didSet {
            //将属性传给父类
            super.anchor = anchor
            //4. 房间名称
            roomNameLabel.text = anchor?.room_name
        }
    }

}
