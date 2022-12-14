//
//  NetworkManager.swift
//  hw11_api_test_project
//
//  Created by Maxim Mitin on 4.11.22.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager(baseURL: URL(string:API.baseURL)!)
    
    let baseURL : URL
    
    private init(baseURL:URL){
        self.baseURL = baseURL
    }
    
    func getPerons(with completion: @escaping ([PokedexElement]) -> ()) {
        let url = self.baseURL
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "error")
                return
            }
            print(data)
            
            
            do {
                let decoder = JSONDecoder()
                let pers = try decoder.decode([PokedexElement].self, from: data)
                DispatchQueue.main.async {
                    completion(pers)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func getPersonsAF(with completion: @escaping ([PokedexElement]) -> ()) {
        let url = self.baseURL
        var persons = [PokedexElement]()
        
        AF.request(url, method: .get).validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success(let value):
                guard let persData = value as? [[String: Any]] else {return}
                
                for persData in persData {
                    
                    let pers = PokedexElement(persData: persData)
                    persons.append(pers)
                }
                
                DispatchQueue.main.async {
                    completion(persons)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}

struct API {
    static let baseURL = "https://psychonauts-api.herokuapp.com/api/characters"
}
