//
//  WritePostViewController.swift
//  csr-chat
//
//  Created by Brandon Sugarman on 5/23/19.
//  Copyright © 2019 Brandon Sugarman. All rights reserved.
//

import UIKit
import Firebase

class WritePostViewController: UIViewController {

    @IBAction func backToNewsfeed(_ sender: UIButton) {
    CSRMethods.app.changeScreens(id: "newsfeed")
    }
    
    @IBAction func goToHome(_ sender: UIButton) {
        CSRMethods.app.changeScreens(id: "home")
    }
    
    @IBOutlet weak var postTextView: UITextView!
    
    @IBAction func tryPost(_ sender: UIButton) {
        let username = UserDefaults.standard.string(forKey: "username")
        
        ref = Database.database().reference().child("posts")
        
        let key = ref.childByAutoId().key
        
        post = self.postTextView.text!
        
        let newPost = [
            key : username! + " : " + post! ]
        
        ref.updateChildValues(newPost)
        
        CSRMethods.app.changeScreens(id: "newsfeed")
        
        
    }
    
    
    var post: String!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
