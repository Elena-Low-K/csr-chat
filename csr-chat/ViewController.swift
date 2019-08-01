//
//  ViewController.swift
//  csr-chat
//
//  Created by Brandon Sugarman on 5/23/19.
//  Copyright © 2019 Brandon Sugarman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToLogin(_ sender: Any) {
        CSRMethods.app.changeScreens(id: "login")
    }

    @IBAction func goToSingUp(_ sender: Any) {
        CSRMethods.app.changeScreens(id: "signup")
    }
    
}

