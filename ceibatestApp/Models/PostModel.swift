//
//  PostModel.swift
//  ceibatestApp
//
//  Created by inicial on 22/9/22.
//

import Foundation

// MARK: - PostModel
struct PostModel:Identifiable, Codable {
    let userID, id: Int?
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID
        case id, title, body
    }
}


