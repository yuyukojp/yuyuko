//
//  CollectionHeaderView.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/18.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    //MARK:控件属性
    
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var iconImageVIew: UIImageView!
    
    @IBOutlet weak var More_Btn: UIButton!
    
    
    //MARK:定义模型属性
    var group : AnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            iconImageVIew.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
    
}

//MARK:- 从xib快速创建方法
extension CollectionHeaderView {
    class func collectionHeaderView() -> CollectionHeaderView {
        return Bundle.main.loadNibNamed("CollectionHeaderView", owner: nil, options: nil)?.first as! CollectionHeaderView
    }
}
