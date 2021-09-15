//
//  ProfileViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/9/13.
//

import Foundation
import UIKit

class ProFileViewController: UIViewController {
    var HttpTools = HttoTools()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    @IBAction func newAccountButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
    }
    
}

//MARK:- 设置UI界面
extension ProFileViewController {
    private func setupUI() {
        view.backgroundColor = UIColor .systemPink

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        HttpTools.test {
            print("+++++获取数据")
        }
    }
}
