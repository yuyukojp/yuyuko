//
//  BaseAnchorViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/4.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let kItemW = (kScreenW - 3 * kItemMargin) / 2
private let kNormalItemH = kItemW * 3 / 4
private let kPrettyItemH = kItemW * 4 / 3
private let kHeaderViewH : CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kPrettyCellID = "kPrettyCellID"
private let kHeaderViewID = "kHeaderViewID"

class BaseAnchorViewController: UIViewController {

    //MARK:- 定义属性
    var baseVM: BaseViewModel!
    lazy var collectionView : UICollectionView = { [unowned self] in
         //1. 创建布局
         let layout = UICollectionViewFlowLayout()
         layout.itemSize = CGSize(width: kItemW, height: kNormalItemH)
         layout.minimumLineSpacing = 0
         layout.minimumInteritemSpacing = kItemMargin
         layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
         //设置内边距
         layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
         //2.创建UIcollectionview
         let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
         
         collectionView.backgroundColor = UIColor.white
         collectionView.dataSource = self
         collectionView.delegate = self
         //高度和宽度随着副控件变化
         collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         //注册cell
         //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
         collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
         collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
         //注册组头
         collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
         collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
         
         return collectionView
     }()
    
    //MARK:- 系统徽调
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }
    
}

//MARK:- 设置UI
extension BaseAnchorViewController {
    @objc func setupUI() {
        view.addSubview(collectionView)
    }
}
//MARK:- 请求数据
extension BaseAnchorViewController {
    @objc func loadData() {
  
    }
}

//MARK:- 遵守uivollcetiom的协议

extension BaseAnchorViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.anchorGroups.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseVM.anchorGroups[section].anchors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1.取出cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
        //2.给cell数据
        cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //1.取出headerview
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        //2.给header设置数据
        headerView.group = baseVM.anchorGroups[indexPath.section]
        
        return headerView
        
    }
}
