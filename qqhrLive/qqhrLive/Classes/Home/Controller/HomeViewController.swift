//
//  HomeViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/4.
//

import UIKit

private let kTitleViewH : CGFloat = 50

class HomeViewController: UIViewController {

    //懒加载属性 通过闭包来创建
    private lazy var pageTitleView : PageTitleView = { [weak self] in
        // 使用全局变量来定义大小
       
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        
        let titles = ["推荐","学习","社团","娱乐"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        
        return titleView
    }()
    
    private lazy var pageContentView : PageContentView = { [weak self] in
        //1. 确定内容frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabbarH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        //2.确定所有子控制器
        var childVcs = [UIViewController]()
        //推荐控制器
        childVcs.append(RecommendViewController())
        childVcs.append(GameViewController())
        childVcs.append(AmuseViewController())
        childVcs.append(FunneyViewController())
   
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
    }()

    //系统回掉函数
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI界面
        setupUI()
    }
    

}

// MARK:　UI界面设置
extension HomeViewController {
    private func setupUI(){
        //0.不需要调整UIScrollview的那边句
        automaticallyAdjustsScrollViewInsets = false
        //1. 设置导航栏
        setupNavigationBar()
        //2.添加titleview
        view.addSubview(pageTitleView)
        //3.添加contentview
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.gray
    }
    
    private func setupNavigationBar() {
        //设置左侧的logo图标
        //使用构造函数来创建
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "launcher_logo_2020")
           
        //设置右侧的iteam
       
        let size = CGSize(width: 40, height: 40)        
        //使用构造函数来实现⬆️
        let historyIteam = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchIteam = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeIteam = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyIteam,searchIteam,qrcodeIteam]
    
    }
}


//遵守PageTitleViewDelegate协议
extension HomeViewController : PageTitleViewDelegate {
    func pageTitleVIew(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

//遵守PageContentViewDelegate协议
extension HomeViewController : PageContentViewDelegate {
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourseIndex: sourceIndex, targetIndex: targetIndex)
    }
}
