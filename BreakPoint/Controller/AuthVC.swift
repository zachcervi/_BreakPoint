//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Zach Cervi on 11/13/17.
//  Copyright © 2017 Zach Cervi. All rights reserved.
//

import UIKit
import Firebase
class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil{
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func googleSignBtnWasPressed(_ sender: Any) {
    }
    @IBOutlet weak var facebookSignBtnWasPressed: UIButton!
    
}
