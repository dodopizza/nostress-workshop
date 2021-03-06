//
// Created by Олег Кузьмин on 2019-03-13.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import Foundation

protocol PairSessionRepositoryProtocol {
    func getSession() -> PairSession
    func saveEvent(_ event: BaseEvent)
}
