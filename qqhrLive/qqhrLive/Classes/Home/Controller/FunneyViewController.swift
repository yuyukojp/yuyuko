//
//  FunneyViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/4.
//

import UIKit
private let kTopMargin : CGFloat = 8

class FunneyViewController: BaseAnchorViewController {
    //MARK:- 懒加载viewmodel对象
    fileprivate lazy var funnyVM: FunnyViewModel = FunnyViewModel()

}

extension FunneyViewController {
    override func setupUI() {
        super.setupUI()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        collectionView.contentInset = UIEdgeInsets(top: kTopMargin, left: 0, bottom: 0, right: 0)
    }
}

extension FunneyViewController {
    override func loadData() {
        //1.给父类viewmodel复制
        baseVM = funnyVM
        //2. 请求数据
        funnyVM.loadFunnyData {
            self.collectionView.reloadData()
            //3.数据请求完毕隐藏动画
            self.loadDataFinished()
        }
    }
}
