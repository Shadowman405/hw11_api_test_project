//
//  Model.swift
//  hw11_api_test_project
//
//  Created by Maxim Mitin on 4.11.22.
//

import Foundation

struct PokedexElement: Codable {
    let gender: Gender
    let img: String
    let id, name: String
    let psiPowers: [PsiPower]
    let v: Int

    enum CodingKeys: String, CodingKey {
        case gender, img
        case id = "_id"
        case name, psiPowers
        case v = "__v"
    }
    
    init(persData: [String: Any]) {
        name = persData["name"] as? String ?? ""
        gender = persData["gender"] as? Gender ?? Gender.male
        img = persData["img"] as? String ?? ""
        psiPowers = persData["psiPowers"] as? [PsiPower] ?? [PsiPower(psiPowerDescription: "", img: "", id: "", name: "")]
        v = persData["v"] as? Int ?? 0
        id = persData["id"] as? String ?? ""
    }
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

// MARK: - PsiPower
struct PsiPower: Codable {
    let psiPowerDescription: String
    let img: String
    let id, name: String

    enum CodingKeys: String, CodingKey {
        case psiPowerDescription = "description"
        case img
        case id = "_id"
        case name
    }
}

typealias Pokedex = [PokedexElement]
