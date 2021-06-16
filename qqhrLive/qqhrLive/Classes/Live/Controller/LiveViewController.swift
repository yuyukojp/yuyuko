//
//  LiveViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/6/15.
//

import UIKit

class LiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

//MARK:- 设置UI界面
extension LiveViewController {
    private func setupUI() {
        view.backgroundColor = UIColor .systemPink
    }
}
