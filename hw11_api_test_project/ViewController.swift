//
//  ViewController.swift
//  hw11_api_test_project
//
//  Created by Maxim Mitin on 4.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let manager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnclicked(_ sender: Any) {
        print("clicked")
        manager.getCards()
    }

}
