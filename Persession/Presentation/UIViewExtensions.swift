//
// Created by Олег Кузьмин on 2019-03-13.
// Copyright (c) 2019 Dodo Pizza. All rights reserved.
//

import UIKit

extension UIView {

    func addSubviewPinnedToBounds(_ view: UIView) {
        self.addSubview(view)
        self.pinToBounds(view)
    }

    func pinToBounds(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}

extension TimeInterval {
    // builds string in app's labels format 00:00.0
    func stringFormatted() -> String {

        let hours = Int(self) / 3600
        let seconds = Int(self) % 60
        let minutes = (Int(self) / 60) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
