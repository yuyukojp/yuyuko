//
//  CollectionCycleCell.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/25.
//

import UIKit
import Kingfisher
private let urlsansan : String = "https://bkimg.cdn.bcebos.com/pic/c995d143ad4bd113ad9f80d557afa40f4afb0582?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxNTA=,g_7,xp_5,yp_5/format,f_auto"

class CollectionCycleCell: UICollectionViewCell {
    //固定图片rul

    //控件属性
    //@IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //定义模型属性
    var cycleModel : CycleModel? {
        didSet {
            //print(cycleModel?.title)
            titleLabel.text = cycleModel?.title
            let iconURL =  cycleModel?.pic_url ?? ""
            iconImageView.kf.setImage(with: URL.init(string: iconURL))
            
        }
    }

}
