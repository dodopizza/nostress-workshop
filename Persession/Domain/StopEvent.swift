//
// Created by Олег Кузьмин on 2019-03-12.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation

class StopEvent: BaseEvent {
    override func getType() -> EventType {
        return .stop
    }
}
