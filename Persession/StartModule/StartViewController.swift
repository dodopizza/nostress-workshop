//
//  StartViewController.swift
//  Persession
//
//  Created by Олег Кузьмин on 2019-03-12.
//  Copyright © 2019 Dodo Pizza. All rights reserved.
//

import UIKit
import Dip

class StartViewController: UIViewController, StoryboardInstantiatable {

    var presenter: StartPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startTapped(_ sender: Any) {
        self.presenter.startTapped()
    }


}
