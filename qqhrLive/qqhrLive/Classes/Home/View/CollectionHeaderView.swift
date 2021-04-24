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
    

    
    //MARK:定义模型属性
    var group : AncharGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            iconImageVIew.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
    
}
