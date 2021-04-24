//
//  CollectionBaseCell.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/24.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    //控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    //定义模型
    var anchor : AnchorModel? {
        didSet {
            //0.校验模型是否有值
            guard let anchor = anchor else { return }
            //1.取出在线人数显示的文字
            var onlinStr : String = ""
            if anchor.online >= 10000{
                onlinStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlinStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlinStr, for: .normal)
            
            //2.显示昵称
            nickNameLabel.text = anchor.nickname
                        
            //3.设置封面图片
            guard let iconURL = NSURL(string: anchor.vertical_src) else { return }
            iconImageView.kf.setImage(with: URL.init(string: anchor.vertical_src))
            
        }
    }
    
}
