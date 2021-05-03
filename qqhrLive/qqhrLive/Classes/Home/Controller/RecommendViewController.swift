//
//  RecommendViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/16.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let kItemW = (kScreenW - 3 * kItemMargin) / 2
private let kNormalItemH = kItemW * 3 / 4
private let kPrettyItemH = kItemW * 4 / 3
private let kHeaderViewH : CGFloat = 50

private let kCycelViewH = kScreenW * 3 / 8
private let kGameViewH : CGFloat = 90

private let kNormalCellID = "kNormalCellID"
private let kPrettyCellID = "kPrettyCellID"
private let kHeaderViewID = "kHeaderViewID"

class RecommendViewController: BaseAnchorViewController {

    //懒加载属性
    private lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    
     //轮播图
    private lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycelViewH + kGameViewH), width: kScreenW, height: kCycelViewH)
        return cycleView
    }()
    //创建下面的播放的那个VIew
    private lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
    

}

//设置UI界面内容
extension RecommendViewController {
    override func setupUI() {
        //1. 调用super
        super.setupUI()

        //2. 将cycleView添加到UICollectionView中
        collectionView.addSubview(cycleView)
        //2.5 将game加入
        collectionView.addSubview(gameView)
        //3. 设置collctionVIew的那边句
        collectionView.contentInset = UIEdgeInsets(top: kCycelViewH + kGameViewH, left: 0, bottom: 0, right: 0)
    }
}

//MARK: 请求数据
extension RecommendViewController {
    override func loadData() {
        //0. 给父类的viewmodel进行赋值
        baseVM = recommendVM
        //1. 请求推荐数据
        recommendVM.requestData{
            //1. 展示推荐数据
            self.collectionView.reloadData()
            //2.将数据传递给GameView
            var groups = self.recommendVM.anchorGroups
            //不显示前两个数据
            groups.removeFirst()
            groups.removeFirst()
            
            //添加一个更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多学习"
            groups.append(moreGroup)

            self.gameView.groups = self.recommendVM.anchorGroups
        }
        //2. 请求轮播数据
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
        
    }
}
