//
//  PersessionTests.swift
//  PersessionTests
//
//  Created by Олег Кузьмин on 2019-03-12.
//  Copyright © 2019 Dodo Pizza. All rights reserved.
//

import XCTest
import Foundation
@testable import Persession

class PersessionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_SessionIsNotStartedByDefault() {
        var session = PairSession()

        XCTAssertEqual(session.state, SessionState.notStarted)
    }

    func test_CanStartNotStartedSession() {
        var session = PairSession()

        session.handle(StartEvent(dateTime: Date()))

        XCTAssertEqual(session.state, SessionState.started)
    }

    func test_CanPauseStartedSession() {
        let session = CreatePairSession().that(.started).please()

        session.handle(PauseEvent(dateTime: Date()))

        XCTAssertEqual(session.state, SessionState.paused)
    }

    func test_CanStopPausedSession() {
        let session = CreatePairSession().that(.paused).please()

        session.handle(StopEvent(dateTime: Date()))

        XCTAssertEqual(session.state, SessionState.stopped)
    }

    func test_CannotStopNotStartedSession() {
        let session = CreatePairSession().that(.notStarted).please()
        let oldState = session.state

        session.handle(StopEvent(dateTime: Date()))

        XCTAssertEqual(session.state, oldState)
    }

    func test_CanResumePausedSession() {
        let session = CreatePairSession().that(.paused).please()

        session.handle(ResumeEvent(dateTime: Date()))

        XCTAssertEqual(session.state, SessionState.started)
    }

    func test_WhenSessionIsNotStartedElapsedTimeGetElapsedTimeReturns_0() {
        var session = PairSession()

        XCTAssertEqual(session.getTimeElapsed(Date(timeInterval: TimeInterval(100), since: Date())), TimeInterval(0))
    }

    func test_WhenSessionIsStartedSecondAgoGetElapsedTimeReturns_1() {
        let date = Date()
        var session = CreatePairSession().startedAt(date).please()
        let oneSecondLater = Date(timeInterval: TimeInterval(1), since: date)

        XCTAssertEqual(session.getTimeElapsed(oneSecondLater), TimeInterval(1))
    }

    func test_WhenSessionIsPausedElapsedTimeDoesNotChange() {
        let session = CreatePairSession().that(.paused).please()
        let firstDate = Date()
        let secondDate = Date(timeInterval: TimeInterval(100), since: firstDate)

        XCTAssertEqual(session.getTimeElapsed(firstDate), session.getTimeElapsed(secondDate))
    }
}
