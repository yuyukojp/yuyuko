//
//  CustomNavigationController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/4.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //隐藏push的tabbar
        viewController.hidesBottomBarWhenPushed = true
        
        super.pushViewController(viewController, animated: animated)
    }
}
