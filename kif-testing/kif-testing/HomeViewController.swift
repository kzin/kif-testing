//
//  HomeViewController.swift
//  kif-testing
//
//  Created by Rodrigo Cavalcante on 10/10/17.
//
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcome: UILabel!
    var user: String?
    
    override func viewDidLoad() {
        if let user = self.user {
            welcome.text = "Welcome, \(user)"
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
