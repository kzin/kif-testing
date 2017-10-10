//
//  ViewController.swift
//  kif-testing
//
//  Created by Rodrigo Cavalcante on 10/10/17.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBAction func btnLogin() {
        if username.text == "user" && password.text == "123123" {
            let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            viewController.user = username.text
            
            self.present(viewController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController.init(title: "Ops", message: "Invalid password", preferredStyle: .alert)
            
            let action = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
            action.accessibilityLabel = "Ok"
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
        }
    }

}

