//
// Created by Олег Кузьмин on 2019-03-13.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//
import RealmSwift
import Foundation

class PairSessionRepository : PairSessionRepositoryProtocol {

    func getSession() -> PairSession {
        let realm = try! Realm()
        let pairSession = PairSession()
        let events = realm
                .objects(EventEntity.self)
                .sorted(by: { $0.dateTime < $1.dateTime })
                .forEach { (event: EventEntity) in
                    switch event.type {
                    case EventEntityType.pause.rawValue:
                        pairSession.handle(PauseEvent(dateTime: event.dateTime))
                    case EventEntityType.stop.rawValue:
                        pairSession.handle(StopEvent(dateTime: event.dateTime))
                    case EventEntityType.start.rawValue:
                        pairSession.handle(StartEvent(dateTime: event.dateTime))
                    case EventEntityType.resume.rawValue:
                        pairSession.handle(ResumeEvent(dateTime: event.dateTime))
                    default:
                        fatalError()
                    }
                }

        return pairSession
    }
}
