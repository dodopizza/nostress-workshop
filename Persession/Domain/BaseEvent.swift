//
// Created by Олег Кузьмин on 2019-03-12.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation

class BaseEvent {
    var dateTime: Date

    init(dateTime: Date) {
        self.dateTime = dateTime
    }

    init() {
        self.dateTime = Date()
    }

    func getType() -> EventType {
        fatalError("not implemented")
    }
}
