//
//  AboutViewController.swift
//  Shoot
//
//  Created by cl-dev on 2019-11-08.
//  Copyright © 2019 subramanian. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

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
    @IBAction func closeInfo() {
        dismiss(animated: true, completion: nil)
    }
}