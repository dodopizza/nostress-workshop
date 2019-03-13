//
// Created by Олег Кузьмин on 2019-03-13.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation
protocol PairSessionServiceProtocol {

    func getSession() -> PairSession
    func saveEvent(_ event: BaseEvent)
}

class PairSessionService : PairSessionServiceProtocol {
    private let pairSessionRepository: PairSessionRepositoryProtocol

    init(pairSessionRepository: PairSessionRepositoryProtocol){
        self.pairSessionRepository = pairSessionRepository
    }
    func getSession() -> PairSession {
        let session = pairSessionRepository.getSession()
        return session
    }

    func saveEvent(_ event: BaseEvent) {
        pairSessionRepository.saveEvent(event)
    }
}
