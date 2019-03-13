//
// Created by Олег Кузьмин on 2019-03-12.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation

protocol StartPresenterProtocol {

    func startTapped()
}

class StartPresenter: StartPresenterProtocol {
    private let pairSessionService: PairSessionServiceProtocol

    init(pairSessionService: PairSessionServiceProtocol) {
        self.pairSessionService = pairSessionService
    }

    func startTapped() {
        pairSessionService.saveEvent(StartEvent())
        NotificationCenter.default.post(name: Notification.Name.eventSaved, object: nil, userInfo: nil)
    }
}
