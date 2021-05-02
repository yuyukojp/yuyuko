//
//  RecommendGameView.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/1.
//

import UIKit

private let kGameCellID = "kGameCellID"
//那边句
private let kEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {
    //定义数据属性
    var groups : [AnchorGroup]? {
        didSet {
            //不显示前两个数据
            groups?.removeFirst()
            groups?.removeFirst()
            
            //添加一个更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多学习"
            groups?.append(moreGroup)
            //刷新表哥
            collectionView.reloadData()
        }
    }
    //MARK：控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK：设置系统控件
    override func awakeFromNib() {
        super.awakeFromNib()
        //注册cell
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        //添加一个那边句
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kGameCellID)
        
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
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        cell.baseGame = groups![indexPath.item]
        
        
        return cell
    }
    
    
}
