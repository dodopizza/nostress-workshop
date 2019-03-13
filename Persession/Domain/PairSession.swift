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
}

enum SessionState {

    case notStarted
    case started
    case paused
    case stopped

}
