//
//  ViewController.swift
//  hw11_api_test_project
//
//  Created by Maxim Mitin on 4.11.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnclicked(_ sender: Any) {
        print("clicked")
        performSegue(withIdentifier: "toTable", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTable" {
            let persTVC = segue.destination as! PersTableViewController
            persTVC.fetchPersons()
        }
    }

}
