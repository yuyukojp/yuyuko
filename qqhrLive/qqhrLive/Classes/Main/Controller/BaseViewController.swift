//
//  BaseViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/2.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: 定义属性
    var contentView : UIView?
    
    // MARK: 懒加载属性
    fileprivate lazy var animImageView : UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named: "loading_1_280x158_"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named: "loading_1_280x158_")!, UIImage(named: "loading_2_280x158_")!]
        imageView.animationDuration = 0.3
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return imageView
    }()
    
    // MARK: 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

extension BaseViewController {
    @objc func setupUI() {
        // 1.隐藏内容的View
        contentView?.isHidden = true
        
        // 2.添加执行动画的UIImageView
        view.addSubview(animImageView)
        
        // 3.给animImageView执行动画
        animImageView.startAnimating()
        
        // 4.设置view的背景颜色
        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
    }
    
    @objc func loadDataFinished() {
        // 1.停止动画
        animImageView.stopAnimating()
        
        // 2.隐藏animImageView
        animImageView.isHidden = true
        
        // 3.显示内容的View
        contentView?.isHidden = false
    }
}

