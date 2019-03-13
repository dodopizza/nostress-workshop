//
// Created by Олег Кузьмин on 2019-03-13.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation

protocol ActiveSessionPresenterProtocol {
    func start()
    func stop()
}

class ActiveSessionPresenter: ActiveSessionPresenterProtocol {

    private weak var ui: ActiveSessionUIProtocol?

    private let pairSessionService: PairSessionServiceProtocol

    init(ui: ActiveSessionUIProtocol, pairSessionService: PairSessionServiceProtocol) {
        self.ui = ui
        self.pairSessionService = pairSessionService
    }

    var timer: Timer!

    func start() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    func stop() {
        timer.invalidate()
    }

    @objc func updateTime() {
        let session = pairSessionService.getSession()
        ui?.setTimerLabelText(text: session.getTimeElapsed(Date()).stringFormatted())
    }
}