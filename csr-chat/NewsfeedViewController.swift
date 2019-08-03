//
//  NewsfeedViewController.swift
//  csr-chat
//
//  Created by Brandon Sugarman on 5/23/19.
//  Copyright © 2019 Brandon Sugarman. All rights reserved.
//

import UIKit
import Firebase

class NewsfeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var posts: Array<String>!
    
    var ref: DatabaseReference!
    
    @IBAction func signOut(_ sender: UIButton) {
        CSRMethods.app.changeScreens(id: "home")
    }
    
    @IBAction func addPost(_ sender: UIButton) {
        CSRMethods.app.changeScreens(id: "writepost")
    }
    
    @IBOutlet weak var newsfeed: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        // write code here -- return the number of cells in the table
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "HH:mm:ss MM/dd/yyyy"
        let formattedDate = format.string(from: date)
        
        // write code here -- let's create our individual cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = cell.textLabel?.font.withSize(30)
        cell.textLabel?.textColor = UIColor.init(red: 125/255, green: 192/255, blue: 250/255, alpha: 1)
        
        cell.textLabel?.text = formattedDate + " " + posts[indexPath.item]
        
        return cell

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference().child("posts")
        
        posts = []
        
        ref.observeSingleEvent(of: DataEventType.value, with: { (snapshot)
            in
            for currentPost in snapshot.children.allObjects as! [DataSnapshot] {
            
            let post = currentPost.value as! String
            self.posts.append(post)
        
            }
            
            self.posts.reverse()
            self.newsfeed.reloadData()
        })
        
        
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
