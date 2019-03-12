//
//  StartViewController.swift
//  Persession
//
//  Created by Олег Кузьмин on 2019-03-12.
//  Copyright © 2019 Dodo Pizza. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    var presenter: StartPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter = StartPresenter()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startTapped(_ sender: Any) {
        self.presenter.startTapped()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
