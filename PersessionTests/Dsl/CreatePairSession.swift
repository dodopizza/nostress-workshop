//
// Created by Олег Кузьмин on 2019-03-12.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation

class CreatePairSession {

    private var state: SessionState!
    private var startDate: Date = Date()

    public func that(_ state: SessionState) -> CreatePairSession {
        self.state = state
        return self
    }

    public func please() -> PairSession {
        let session = PairSession()

        switch state! {
        case .started:
            session.handle(StartEvent(dateTime: startDate))
        case .paused:
            session.handle(StartEvent(dateTime: startDate))
            session.handle(PauseEvent(dateTime: Date()))
        case .notStarted:
            break
        default:
            fatalError()
        }
        return session
    }

    public func startedAt(_ date: Date) -> CreatePairSession  {
        self.startDate = date
        self.state = .started
        return self
    }
}
