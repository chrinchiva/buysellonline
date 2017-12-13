//
//  userProfileDetailViewController.swift
//  BuySellOnline
//
//  Created by petersoeun on 12/13/17.
//  Copyright © 2017 RoboCam. All rights reserved.
//

import UIKit

class userProfileDetailViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UILabel!
    @IBOutlet weak var emailTextField: UILabel!
    @IBOutlet weak var imageProfileView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.text = MyApp.shared.username
        emailTextField.text = MyApp.shared.email
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
