//
//  CollectionPrettyCell.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/18.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: CollectionBaseCell {

    //MARK: 控件属性

    @IBOutlet weak var cityBtn: UIButton!
    
    //MARK:定义模型属性
    override var anchor : AnchorModel? {
        didSet {
            //将属性传递给父类
            super.anchor = anchor
            //3.显示城市
            cityBtn.setTitle(anchor?.anchor_city, for: UIControl.State())

        }
    }

}
