//
//  PersTableViewController.swift
//  hw11_api_test_project
//
//  Created by Maxim Mitin on 4.11.22.
//

import UIKit

class PersTableViewController: UITableViewController {
    
    private var persons: [PokedexElement] = []
    //private let manager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        getPersons()
        tableView.rowHeight = 150
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersTableViewCell
        let pers = persons[indexPath.row]
        cell.configCell(with: pers)

        return cell
    }
    
}


extension PersTableViewController {
    func getPersons() {
        let url = URL(string: "https://psychonauts-api.herokuapp.com/api/characters")!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "error")
                return
            }
            print(data)
            
            
            do {
                let decoder = JSONDecoder()
                self.persons = try decoder.decode([PokedexElement].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(self.persons.count)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
