//
//  ViewController.swift
//  example-https
//
//  Created by cl-dev on 2019-11-12.
//  Copyright © 2019 subramanian. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    // an empty array to stor the messages retrieved from Firebase
    var postData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // set the Firebase reference
        ref = Database.database().reference()
        ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            // add the value to the postData array
             let post = snapshot.value as? String
            if let actualPost = post {
                self.postData.append(actualPost)
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell! 
    }
}

