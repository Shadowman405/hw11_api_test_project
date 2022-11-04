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
