//
// Created by Олег Кузьмин on 2019-03-13.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//
import RealmSwift
import Foundation

class EventEntity : Object {
    @objc dynamic var dateTime = Date()
    @objc dynamic var type = ""
}
