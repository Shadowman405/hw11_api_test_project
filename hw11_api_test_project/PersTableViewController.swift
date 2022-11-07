//
//  PersTableViewController.swift
//  hw11_api_test_project
//
//  Created by Maxim Mitin on 4.11.22.
//

import UIKit

class PersTableViewController: UITableViewController {
    
    private var persons: [PokedexElement] = []
    private let manager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 150
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersTableViewCell
        let pers = persons[indexPath.row]
        cell.configCell(with: pers)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = persons[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let persDVC = segue.destination as! DetailsViewController
            let selectedRow = tableView.indexPathForSelectedRow!.row
            persDVC.pers = persons[selectedRow]
            //persDVC.configView()
        }
    }
}


extension PersTableViewController {
//    func getPersons() {
//        let url = URL(string: "https://psychonauts-api.herokuapp.com/api/characters")!
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "error")
//                return
//            }
//            print(data)
//
//
//            do {
//                let decoder = JSONDecoder()
//                self.persons = try decoder.decode([PokedexElement].self, from: data)
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//                print(self.persons.count)
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
    
    func fetchPersons(){
        manager.getPerons { persons in
            self.persons = persons
            self.tableView.reloadData()
        }
    }
    
    func fetchPersonsAF() {
        manager.getPersonsAF()
    }
}
