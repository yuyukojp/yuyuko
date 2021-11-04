//
//  newAccountViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/9/13.
//

import Foundation
import UIKit

class newAccountViewController: UIViewController {
    private var dataSource: [String] = []
    private let userNameIndex: Int = 0
    private let passwordIndex: Int = 1
    private let passwprdConfirmIndex: Int = 2
    private let telIndex: Int = 3
    private let emailIndex: Int = 4
    private var infoChecked: [Bool] = [false, false, false, false, false]
//    private let userNameIndex: Int = 5
//    private let passwordIndex: Int = 6
//    private var focusCellTag: Int = -1

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
        view.backgroundColor = UIColor.systemPink
        setLeftBarButtonItem()
        setRightBarButtonItem()
        setupTableView()
        self.navigationItem.title = "新規登録"
    }
       
    private func changeViewController() {
        let change = HomeViewController()
        change.hidesBottomBarWhenPushed = true
       // self.navigationController?.pushViewController(change, animated: true)
    }
    
    //MARK:- 设置left navigationbar
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
        let item = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(leftBarButtonItemSelected))
        self.navigationItem.leftBarButtonItem = item
        
    }
    //MARK:-　设置Right navigationbar
    func setRightBarButtonItem(image: UIImage? = UIImage(named: "pull_loading_4_60x60_"), title: String? = "完了") {
        //画像、文字のみの場合
        let item = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(rightBarButtonItemSelected))
        self.navigationItem.rightBarButtonItem = item
        
    }
    @objc func leftBarButtonItemSelected(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func rightBarButtonItemSelected(_ sender: UIButton) {
//        if checkUserInfo().0 {
//            navigationController?.popViewController(animated: true)
//            saveAction()
//        } else {
//            showInfoCheckAlert(str: checkUserInfo().1!)
//        }
        showInfoCheckAlert(str: "( ✌︎'ω')✌︎ ✌︎('ω'✌︎ )")
        
    }
    
    func checkUserInfo() -> (checkInfoFlag: Bool, errorMessage: String?) {
        // User名チェック
        print(dataSource[userNameIndex])
        if dataSource[userNameIndex].count > 32 {
            return (false, "長すぎ32以内にして")
        }

        // パスワードチェッく
        print(passwordIndex)
        if dataSource[passwordIndex].count > 20 {
            return (false, "２０文字以内にして")
        }
        // パスワードが同一であるかをチェック
        if dataSource[passwordIndex] != dataSource[passwprdConfirmIndex] {
            return (false, "パスワードと確認パスワードが違うの！")
        }

        return (true, nil)
    }
    
    func saveAction() {
//        saveSiteData { [weak self] isSuccess, _ in
//            self?.hideProgress()
//            if isSuccess {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    self?.dismiss(animated: true, completion: nil)
//                }
//            } else {
//                self?.navigationItem.rightBarButtonItem?.isEnabled = true
//            }
//        }
    }
    
    func setupSiteInfo(id: Int?) {
        var data: InfoData?

    }
    
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserInfoCell", bundle: nil), forCellReuseIdentifier: "UserInfoCell")
        tableView.estimatedRowHeight = 44
        tableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        view.addSubview(tableView)
    }
    
    //MARK:- 各項目データ、いずれ抽出すべき
    private func returnText(index: (Int, Int)) -> (String, String) {
        // case
        var section: Int!
        var row: Int!
        var title: String!
        var placeholder: String!
        
        section = index.0
        row = index.1
        
        switch section {
        case 0:
            switch row {
            case 0:
                title = "ユーザー名"
                placeholder = "ユーザー名を入力してください"
            case 1:
                title = "パスワード"
                placeholder = "パスワードを入力してください"
            case 2:
                title = "パスワード確認"
                placeholder =  "上と同じものを入力して！"
            default:
                title = "title：エラー"
                placeholder = "placeholder：エラー"
            }
        case 1:
            switch row {
            case 0:
                title = "電話番号"
                placeholder = "数字のみ入力して！"
            case 1:
                title = "メールアドレス"
                placeholder = "xx@xx.xxの形式で入力して！"
            default:
                title = "title：エラー"
                placeholder = "placeholder：エラー"
            }
        default:
            title = "title：エラー"
            placeholder = "placeholder：エラー"
        }

        
        return (title, placeholder)
    }
    
    private func showInfoCheckAlert(str: String) {
        let alert = newAccountViewController.makeAlert(
            title: "エラーっす",
            message: str,
            okAction: ("うっす", {
                self.tableView.reloadData()
            }),
            cacelAction: nil
        )
        present(alert, animated: true, completion: nil)
    }
    
    static func makeAlert(title: String?,
                          message: String?,
                          okAction: (title: String, action: () -> Void)?,
                          cacelAction: (title: String, action: () -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if okAction != nil {
            let ok = UIAlertAction(title: okAction?.title, style: .default) { action in
                okAction?.action()
            }
            alert.addAction(ok)
        }

        if cacelAction != nil {
            let cancel = UIAlertAction(title: cacelAction?.title, style: .default) { action in
                cacelAction?.action()
            }
            alert.addAction(cancel)
        }

        return alert
    }
}

extension newAccountViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2//mode == .editMode ? 5 : 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        default:
            return 0
        }
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

        let label = UILabel(frame: CGRect(x: 16, y: 5, width: 200, height: 42))
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        switch section {
        case 0:
            label.text = "ユーザ名"
        case 1:
            label.text = "その他"
        default:
            label.text = "むふふ"
        }
        
        view.addSubview(label)
        return view
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let itemCounts = 10
        print(dataSource.count)
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell", for: indexPath) as? UserInfoCell else { return UITableViewCell() }
            cell.detailTextField.placeholder = returnText(index: (indexPath.section, indexPath.row)).1
            cell.detailTextField.tag = userNameIndex
            cell.detailTextField.delegate = self
            cell.selectionStyle = .none
            let detailData = dataSource.count == itemCounts ? dataSource[indexPath.row] : nil
            cell.setup(title: returnText(index: (indexPath.section, indexPath.row)).0, detail: detailData, isPassword: false)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell", for: indexPath) as? UserInfoCell else { return UITableViewCell() }
            cell.detailTextField.placeholder = returnText(index: (indexPath.section, indexPath.row)).1
            cell.detailTextField.tag = userNameIndex
            cell.detailTextField.delegate = self
            cell.selectionStyle = .none
            let detailData = dataSource.count == itemCounts ?dataSource[indexPath.row] : nil
            cell.setup(title: returnText(index: (indexPath.section, indexPath.row)).0, detail: detailData, isPassword: false)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension newAccountViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // = ""//(textField.text ?? "") as String
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
//        infoChecked[textField.tag] = textField.text?.count ?? 0 > 0
//        infoChecked[httpPortIndex] = true
//        infoChecked[rtspPortIndex] = true
//        updateSaveButton()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField.tag == userNameIndex {
//            return string.isSiteNameConfrim
//        }
//        if textField.tag == addressIndex {
//            return string.isAlphanumericHyphenPeriod
//        }
//        if textField.tag == httpPortIndex || textField.tag == rtspPortIndex {
//            return string.isNumeric
//        }
//        if textField.tag == userNameIndex || textField.tag == passwordIndex {
//            return string.isAlphanumericNumber
//        }

        return true
    }
}
