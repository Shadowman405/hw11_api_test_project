//
//  NetworkManager.swift
//  hw11_api_test_project
//
//  Created by Maxim Mitin on 4.11.22.
//

import Foundation


class NetworkManager {
    static let shared = NetworkManager(baseURL: URL(string:API.baseURL)!)
    
    let baseURL : URL
    
    private init(baseURL:URL){
        self.baseURL = baseURL
    }
    
    func getCards() {
        let url = self.baseURL
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "error")
                return
            }
            print(data)
        }.resume()
    }
    
}


struct API {
    
    static let baseURL = "http://alpha-meme-maker.herokuapp.com/memes/12"
}
