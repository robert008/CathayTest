//
//  FavoriteModel.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/11.
//

import Foundation

//struct Result : Codable {
//    let favoriteList : [FavoriteList]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case favoriteList = "favoriteList"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        favoriteList = try values.decodeIfPresent([FavoriteList].self, forKey: .favoriteList)
//    }
//
//}

struct FavoriteList : Codable {
    let nickname : String?
    let transType : String?

    enum CodingKeys: String, CodingKey {

        case nickname = "nickname"
        case transType = "transType"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nickname = try values.decodeIfPresent(String.self, forKey: .nickname)
        transType = try values.decodeIfPresent(String.self, forKey: .transType)
    }

}
