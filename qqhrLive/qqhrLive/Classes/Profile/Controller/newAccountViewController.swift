//
//  newAccountViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/9/13.
//

import Foundation
import UIKit

class newAccountViewController: UIViewController, UITableViewDataSource {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.tintColor = .white
        changeViewController()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @objc private func closeButtonAction(_ target: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

//MARK:- 设置UI界面
extension newAccountViewController {
    private func setupUI() {
        view.backgroundColor = UIColor .systemPink
        setLeftBarButtonItem()
        setupTableView()
        self.navigationItem.title = "新規登録"
        
    }
       
    private func changeViewController() {
        let change = HomeViewController()
        change.hidesBottomBarWhenPushed = true
       // self.navigationController?.pushViewController(change, animated: true)
    }
    
    //MARK:- 设置right navigationbar
    func setLeftBarButtonItem(image: UIImage? = UIImage(named: "pull_loading_4_60x60_"), title: String? = "閉じる") {
        //戻るボタンに画像と文字共存の場合
//        let  backButton = UIButton (type: .system )
//        backButton.frame = CGRect(x: 0, y: 0, width: 65, height: 30)
//        backButton.setImage(image, for: .normal)
//        backButton.setTitle("戻る", for: .normal)
//        backButton.addTarget(self, action: #selector(rightBarButtonItemSelected), for: .touchUpInside)
//
//        let leftBarBtn = UIBarButtonItem(customView: backButton)
//
//        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        spacer.width = -10;
//
//        self.navigationItem.leftBarButtonItems = [spacer,leftBarBtn]
        
        //画像、文字のみの場合
        let item = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(rightBarButtonItemSelected))
        self.navigationItem.leftBarButtonItem = item
        
    }
    
    @objc func rightBarButtonItemSelected(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserInfoCell", bundle: nil), forCellReuseIdentifier: "UserInfoCell")
        tableView.estimatedRowHeight = 44
        view.addSubview(tableView)
    }
   
}

extension newAccountViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }
        return 42
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 || section == 4 { return UIView() }
        let view = UIView()
        view.backgroundColor = .clear

        let label = UILabel(frame: CGRect(x: 16, y: 5, width: 200, height: 42))
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.4705882353, green: 0.4705882353, blue: 0.4705882353, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true

        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "UserInfoCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        }
        return cell!
    }
}
