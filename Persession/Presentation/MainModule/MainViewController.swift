//
//  MainViewController.swift
//  Persession
//
//  Created by Олег Кузьмин on 2019-03-13.
//  Copyright © 2019 Dodo Pizza. All rights reserved.
//

import UIKit
import Dip

protocol MainUIProtocol: class {
    func showSession(session: PairSession)
}

class MainViewController: UIViewController, StoryboardInstantiatable {

    @IBOutlet weak var containerView: UIView!

    var presenter: MainPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        // Do any additional setup after loading the view.
    }

    var activeSessionViewController: ActiveSessionViewController?
}

extension MainViewController: MainUIProtocol {
    func showSession(session: PairSession) {
        self.children.forEach { childController in
            childController.willMove(toParent: nil)
            childController.view.removeFromSuperview()
            childController.removeFromParent()
        }
        switch session.state {

        case .notStarted:
            let storyboard = UIStoryboard(name: "Start", bundle: nil)
            let controller = storyboard.instantiateInitialViewController()!
            self.addChild(controller)
            containerView.addSubviewPinnedToBounds(controller.view)
            controller.didMove(toParent: self)

        case .started:
            let storyboard = UIStoryboard(name: "ActiveSession", bundle: nil)
            let controller = storyboard.instantiateInitialViewController()!
            self.addChild(controller)
            containerView.addSubviewPinnedToBounds(controller.view)
            controller.didMove(toParent: self)

        default:
            fatalError()
        }
    }
}
