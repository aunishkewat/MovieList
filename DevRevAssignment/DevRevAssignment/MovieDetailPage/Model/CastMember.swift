//
//  CastMember.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 04/03/24.
//

import Foundation
struct CastMember: Decodable {
    let id: Int
    let name: String
    let character: String
    let profilePath: String?
    let gender: Int?
    let order: Int

    enum CodingKeys: String, CodingKey {
        case id, name, character, gender, order
        case profilePath = "profile_path"
    }
}

struct CastResponse: Decodable {
    let id: Int
    let cast: [CastMember]
}
