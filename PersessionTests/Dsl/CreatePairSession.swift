//
// Created by Олег Кузьмин on 2019-03-12.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation

class CreatePairSession {

    private var state: SessionState!

    public func that(_ state: SessionState) -> CreatePairSession {
        self.state = state
        return self
    }


    public func please() -> PairSession {
        let session = PairSession()

        switch state! {
        case .started:
            session.handle(StartTappedEvent(dateTime: Date()))
        case .paused:
            session.handle(StartTappedEvent(dateTime: Date()))
            session.handle(PauseTappedEvent(dateTime: Date()))
        case .notStarted:
            break
        default:
            fatalError()
        }
        return session
    }
}
