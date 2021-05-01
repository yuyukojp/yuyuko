//
//  RecommendGameView.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/1.
//

import UIKit

private let kGameCellID = "kGameCellID"

class RecommendGameView: UIView {
    //MARK：控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK：设置系统控件
    override func awakeFromNib() {
        super.awakeFromNib()
        //注册cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kGameCellID)
        
    }
  

}

//MARK: 提供快速创建的类方法
extension RecommendGameView {
    class func recommendGameView () -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}
//MARK： 遵守UICollectionView
extension RecommendGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath)
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.blue
        return cell
    }
    
    
}
