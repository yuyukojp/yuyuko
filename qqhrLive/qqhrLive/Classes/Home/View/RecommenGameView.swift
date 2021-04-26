//
//  RecommenGameView.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/27.
//
/*
import UIKit
private let kGameCellID = "kGameCellID"

class RecommenGameView: UIView {
    //控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    //系统会掉
    override class func awakeFromNib() {
        super.awakeFromNib()
        //注册cel
       collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
    }
 
}

//MARK:提供快速创建的泪方法
extension RecommenGameView {
    class func recommendGameView() -> RecommenGameView {
        return Bundle.main.loadNibNamed("RecommenGameView", owner: nil, options: nil)?.first as! RecommenGameView
    }
}

//MARK 准手uicolleton

extension RecommenGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>)
    }
}
*/

import UIKit

private let kGameCellID = "kGameCellID"
private let kEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {
    
    // MARK: 定义数据的属性
    var groups : [BaseGameModel]? {
        didSet {
            // 刷新表格
            collectionView.reloadData()
        }
    }
    
    // MARK: 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 让控件不随着父控件的拉伸而拉伸
       // autoresizingMask = UIViewAutoresizing()
        
        // 注册Cell
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        // 给collectionView添加内边距
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
    }
}


// MARK:- 提供快速创建的类方法
extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}


// MARK:- 遵守UICollectionView的数据源协议
extension RecommendGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) //as! CollectionGameCell
        
        cell.baseGame = groups![(indexPath as NSIndexPath).item]
        
        return cell
    }
}
