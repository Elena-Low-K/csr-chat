//
//  SignupViewController.swift
//  csr-chat
//
//  Created by Brandon Sugarman on 5/23/19.
//  Copyright © 2019 Brandon Sugarman. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBAction func goToHome(_ sender: UIButton) {
        CSRMethods.app.changeScreens(id: "home")
    }
    
    @IBAction func trySignUp(_ sender: UIButton) {
        if emailTextField.text == "" {
            CSRMethods.app.showAlert(titleMessage: "CSR Alert", messageString: "No email entered")
            return
        }
        if usernameTextField.text == "" {
            CSRMethods.app.showAlert(titleMessage: "CSR Alert", messageString: "No username entered")
            return
        }
        if passwordTextField.text == "" {
            CSRMethods.app.showAlert(titleMessage: "CSR Alert", messageString: "No password entered")
            return
        }
        if confirmPasswordTextField.text == "" {
            CSRMethods.app.showAlert(titleMessage: "CSR Alert", messageString: "No confirm password entered")
            return
        }
        if confirmPasswordTextField.text != passwordTextField.text {
            CSRMethods.app.showAlert(titleMessage: "CSR Alert", messageString: "Passwords do not match")
            return
        }
        
        UserDefaults.standard.set(usernameTextField.text!, forKey: "username")
        
        CSRMethods.app.signUp(username: usernameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)


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
