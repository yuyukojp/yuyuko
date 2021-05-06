//
//  GameViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/2.
//

import UIKit

private let kEdgeMargin : CGFloat = 10
private let kItemW: CGFloat = (kScreenW - 2 * kEdgeMargin) / 3
private let kItemH: CGFloat = kItemW * 6 / 5
private let kHeaderViewH : CGFloat = 50
private let kGameViewH: CGFloat = 90
//注册ID
private let kGameCellID = "kGameCellID"
private let kHeaderViewID = "kHeaderViewID"

class GameViewController: BaseViewController {

    //MARK:- 懒加载属性

    fileprivate lazy var gameVM : GameViewModel = GameViewModel()
    
    fileprivate lazy var collectionView : UICollectionView = { [unowned self] in
        //1.创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize (width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        //加载头
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        //2.创建collectionview

        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        //注册cell
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        //设置数据源
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = UIColor.white

        
        return collectionView
        
    }()
    
    fileprivate lazy var topHeaderView: CollectionHeaderView = {
        let headerView = CollectionHeaderView.collectionHeaderView()
        headerView.frame = CGRect(x: 0, y: -(kHeaderViewH + kGameViewH), width: kScreenW, height: kHeaderViewH)
        headerView.iconImageVIew.image = UIImage(named: "Img_orange")
        headerView.titleLabel.text = "推荐类"
        headerView.More_Btn.isHidden = true
        return headerView
    }()
    
    fileprivate lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
    
    //MARK: 系统回吊
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
      
    }
    
}

//MARK:- 设置UI界面
extension GameViewController {
    override func setupUI() {
        //0.给contentview进行赋值
        contentView = collectionView
        //1.添加collectionview
        view.addSubview(collectionView)
        //2.添加顶部的headerview
        collectionView.addSubview(topHeaderView)
        //3.学霸view添加到collectionview
        collectionView.addSubview(gameView)
        //设置collectionview的那边句
        collectionView.contentInset = UIEdgeInsets(top: kHeaderViewH + kGameViewH, left: 0, bottom: 0, right: 0)
        super.setupUI()
    }
}
//MARK:- 请求数据
extension GameViewController {
    

    fileprivate func loadData() {
        
        gameVM.loadAllGameData {
            //1.展示全部内容
            self.collectionView.reloadData()

            //1.展示推荐

            self.gameView.groups = Array(self.gameVM.games[0..<10])
            //3.数据请求完成
            self.loadDataFinished()
        }
     }
}



// MARK:- 遵守UICollectionView的数据源&代理
extension GameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1.获取cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        
        cell.baseGame = gameVM.games[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1.取出HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        
        // 2.给HeaderView设置属性
        headerView.titleLabel.text = "全部"
        headerView.iconImageVIew.image = UIImage(named: "Img_orange")
        headerView.More_Btn.isHidden = true

        
        return headerView
    }
}


