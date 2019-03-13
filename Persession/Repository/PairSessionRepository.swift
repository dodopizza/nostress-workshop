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
                    case EventType.pause.rawValue:
                        pairSession.handle(PauseEvent(dateTime: event.dateTime))
                    case EventType.stop.rawValue:
                        pairSession.handle(StopEvent(dateTime: event.dateTime))
                    case EventType.start.rawValue:
                        pairSession.handle(StartEvent(dateTime: event.dateTime))
                    case EventType.resume.rawValue:
                        pairSession.handle(ResumeEvent(dateTime: event.dateTime))
                    default:
                        fatalError()
                    }
                }

        return pairSession
    }

    func saveEvent(_ event: BaseEvent) {
        let realm = try! Realm()
        let eventEntity = event.toEntity()
        try! realm.write {
            realm.add(eventEntity)
        }
    }

}
extension BaseEvent {
    func toEntity() -> EventEntity {
        let eventEntity = EventEntity()
        eventEntity.dateTime = self.dateTime
        eventEntity.type = self.getType().rawValue
        return eventEntity
    }
}
