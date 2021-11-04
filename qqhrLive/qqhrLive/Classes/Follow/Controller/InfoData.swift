//
//  FileModel.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/11/3.
//

import Foundation

final class InfoData: NSObject {
    @objc dynamic var id: Int = 0
    @objc dynamic var userName: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var passwprdConfirm: String = ""
    @objc dynamic var tel: String?
    @objc dynamic var email: String?

    /// the site property
    /// - Parameters:
    ///   - id: ID番号
    ///   - userName: ユーザー名
    ///   - password: パスワード
    ///   - passwprdConfirm: パスワード確認
    ///   - tel: 電話番号
    ///   - email: メールアドレス
    convenience init(userName: String = "", password: String = "", passwprdConfirm: String = "",
                     tel: String?, email: String?) {
        self.init()
        self.userName = userName
        self.password = password
        self.passwprdConfirm = passwprdConfirm
        self.tel = tel
        self.email = email
    }
}
