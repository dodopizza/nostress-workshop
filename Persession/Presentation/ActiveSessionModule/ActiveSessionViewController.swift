//
//  ActiveSessionViewController.swift
//  Persession
//
//  Created by Олег Кузьмин on 2019-03-13.
//  Copyright © 2019 Dodo Pizza. All rights reserved.
//

import UIKit
import Dip

protocol ActiveSessionUIProtocol: class {
    func setTimerLabelText(text: String)
}

class ActiveSessionViewController: UIViewController, StoryboardInstantiatable {
    var presenter: ActiveSessionPresenterProtocol!

    @IBOutlet weak var timerLabel: UILabel!

    @IBAction func pauseTapped(_ sender: Any) {
    }
    
    @IBAction func resumeTapped(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.start()

        // Do any additional setup after loading the view.
    }
}

extension ActiveSessionViewController: ActiveSessionUIProtocol {
    func setTimerLabelText(text: String) {
        timerLabel.text = text
    }
}