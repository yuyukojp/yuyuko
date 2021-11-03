//
//  UserInfoCell.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/9/13.
//

import UIKit

class UserInfoCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var protocolSwitch: UISwitch!
    

    private let siteNameIndex: Int = 0
    private let addressIndex: Int = 2
    private let httpPortIndex: Int = 3
    private let rtspPortIndex: Int = 4
    private let userNameIndex: Int = 5
    private let passwordIndex: Int = 6

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(title: String, detail: String?, isPassword: Bool) {
        self.backgroundColor = UIColor.white
        titleLabel.text = title
        detailTextField.text = detail
        detailTextField.isSecureTextEntry = isPassword
        showPasswordButton.isHidden = !isPassword
        if detailTextField.tag == httpPortIndex || detailTextField.tag == rtspPortIndex {
            detailTextField.keyboardType = .numberPad
        } else if detailTextField.tag == userNameIndex {
            detailTextField.keyboardType = .asciiCapable
        } else {
            detailTextField.keyboardType = .default
        }
    }

    @IBAction func showPassword() {
        if detailTextField.isSecureTextEntry {
            detailTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(named: "bottom_tabbar_followinghome_selected_22x22_"), for: .normal)
        } else {
            detailTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(named: "bottom_tabbar_mainhome_selected_22x22_"), for: .normal)
        }
    }
}
