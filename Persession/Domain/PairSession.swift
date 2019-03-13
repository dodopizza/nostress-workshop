//
// Created by Олег Кузьмин on 2019-03-12.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation

class PairSession {
    private(set) var state: SessionState

    init() {
        self.state = .notStarted
    }

    public func handle(_ event: StartEvent) {
        state = .started
    }

    public func handle(_ event: PauseEvent) {
        state = .paused
    }

    public func handle(_ event: StopEvent) {
        if state == .paused {
            state = .stopped
        }
    }

    public func handle(_ event: ResumeEvent) {
        state = .started
    }

    public func handle(_ event: BaseEvent) {
        switch event.getType(){
        case .start:
            handle(event as! StartEvent)
        case .stop:
            handle(event as! StopEvent)
        case .resume:
            handle(event as! ResumeEvent)
        case .pause:
            handle(event as! PauseEvent)
        }
    }

    func getTimeElapsed(_ date: Date) -> TimeInterval {
        return TimeInterval(42*60)
    }
}

enum SessionState {

    case notStarted
    case started
    case paused
    case stopped

}
