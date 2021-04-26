//
//  CollectionCycleCell.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/25.
//

import UIKit
import Kingfisher
private let urlsansan : String = "https://baike.baidu.com/pic/33%E5%A8%98/3592153/1/c995d143ad4bd113ad9f80d557afa40f4afb0582?fr=lemma&ct=single"

class CollectionCycleCell: UICollectionViewCell {
    //固定图片rul

    //控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //定义模型属性
    var cycleModel : CycleModel? {
        didSet {
            //titleLabel.text = cycleModel?.title
            let iconURL = NSURL(string: cycleModel?.pic_url ?? "")!
            //iconImageView.kf.setImage(with: iconURL)
            
        }
    }

}
