//
// Created by Олег Кузьмин on 2019-03-12.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation

class PairSession {
    private(set) var state: SessionState

    private var startedDateTime: Date?

    init() {
        self.state = .notStarted
    }

    public func handle(_ event: StartEvent) {
        state = .started
        self.startedDateTime = event.dateTime
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
        switch event.getType() {
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
        if state == .notStarted {
            return TimeInterval(0)
        } else {
            return date.timeIntervalSince(startedDateTime!)
        }
    }
}

enum SessionState {

    case notStarted
    case started
    case paused
    case stopped

}
