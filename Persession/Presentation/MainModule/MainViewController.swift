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
    
    var startViewController: StartViewController?
    var activeSessionViewController: ActiveSessionViewController?

}

extension MainViewController: MainUIProtocol {
    func showSession(session: PairSession) {
        switch session.state{
        case .notStarted:
            let storyboard = UIStoryboard(name: "Start", bundle: nil)
            let controller = storyboard.instantiateInitialViewController()!
            self.addChild(controller)
            containerView.addSubview(controller.view)
            controller.didMove(toParent: self)
            self.startViewController = controller as! StartViewController
        case .started:
           break
        default:
            fatalError()
        }
    }
}
