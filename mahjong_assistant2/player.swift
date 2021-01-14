//
//  player.swift
//  mahjong_assistant2
//
//  Created by 平岡煌琉 on 2021/01/14.
//

import UIKit
import RealmSwift
import Realm

class player: Object {
    @objc dynamic var player1name = ""
    @objc dynamic var player2name = ""
    @objc dynamic var player3name = ""
    @objc dynamic var player4name = ""
    @objc dynamic var player1score: Int = 0
    @objc dynamic var player2score: Int = 0
    @objc dynamic var player3score: Int = 0
    @objc dynamic var player4score: Int = 0

}
