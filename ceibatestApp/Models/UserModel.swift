//
//  UserModel.swift
//  ceibatestApp
//
//  Created by inicial on 22/9/22.
//

import Foundation

// MARK: - UserModel
struct UserModel: Identifiable, Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
    
    func updateUsers() -> UserModel {
        return UserModel(id: id, name: name, username: username, email: email, address: address, phone: phone, website: website, company: company)
    }
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String?
}


