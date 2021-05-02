//
//  CollectionGameCell.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/1.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {

    //MARK：控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: 定义属性
    var baseGame : BaseGameModel? {
        didSet {
            titleLabel.text = baseGame?.tag_name
            let iconURL =  baseGame?.icon_url ?? ""
            iconImageView.kf.setImage(with: URL.init(string: iconURL), placeholder: UIImage(named: "pull_loading_2_60x60_"))
        }
    }
   
/*
    //MARK:系统徽调
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
*/
}
