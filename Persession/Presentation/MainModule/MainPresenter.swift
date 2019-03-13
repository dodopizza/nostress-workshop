//
// Created by Олег Кузьмин on 2019-03-13.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol {

    func load()
}

class MainPresenter: MainPresenterProtocol {
    private let pairSessionService: PairSessionServiceProtocol
    private let bgQueue: DispatchQueue
    private weak var ui: MainUIProtocol?

    init(pairSessionService: PairSessionServiceProtocol, ui: MainUIProtocol) {
        self.pairSessionService = pairSessionService
        self.bgQueue = DispatchQueue.global(priority: .background)
        self.ui = ui
    }
    func load() {
        bgQueue.async {
            let currentSession = self.pairSessionService.getSession()
            DispatchQueue.main.async {
                self.ui!.showSession(session: currentSession)
            }
        }
    }
}
