//
//  newAccountViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/9/13.
//

import Foundation
import UIKit

class newAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.tintColor = .white
        setupUI()
        setRightBarButtonItem()
    }
    
    @objc private func closeButtonAction(_ target: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

//MARK:- 设置UI界面
extension newAccountViewController {
    private func setupUI() {
        view.backgroundColor = UIColor .systemPink
        setRightBarButtonItem()
        self.navigationItem.title = "新規登録"
        
    }
    //MARK:- 设置right navigationbar
    func setRightBarButtonItem(image: UIImage? = UIImage(named: "column_back_white_8x14_"), title: String? = "閉じる") {
        let item = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(rightBarButtonItemSelected))
        item.title = title
        item.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 14)], for: .normal)
        item.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 14)], for: .highlighted)
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func rightBarButtonItemSelected(_ sender: UIButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
