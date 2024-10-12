//
//  BaseModel.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/12.
//

import Foundation

struct Json4Swift_Base : Codable {
    let msgCode : String?
    let msgContent : String?
    let result : Result?

    enum CodingKeys: String, CodingKey {

        case msgCode = "msgCode"
        case msgContent = "msgContent"
        case result = "result"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        msgCode = try values.decodeIfPresent(String.self, forKey: .msgCode)
        msgContent = try values.decodeIfPresent(String.self, forKey: .msgContent)
        result = try values.decodeIfPresent(Result.self, forKey: .result)
    }

}

struct Result : Codable {
    let bannerList : [BannerList]?
    let favoriteList : [FavoriteList]?
    let savingsList : [SavingsList]?
    let digitalList : [DigitalList]?
    let fixedDepositList : [FixedDepositList]?
    let messages : [Messages]?

    enum CodingKeys: String, CodingKey {

        case bannerList = "bannerList"
        case favoriteList = "favoriteList"
        case savingsList = "savingsList"
        case digitalList = "digitalList"
        case fixedDepositList = "fixedDepositList"
        case messages = "messages"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bannerList = try values.decodeIfPresent([BannerList].self, forKey: .bannerList)
        favoriteList = try values.decodeIfPresent([FavoriteList].self, forKey: .favoriteList)
        savingsList = try values.decodeIfPresent([SavingsList].self, forKey: .savingsList)
        digitalList = try values.decodeIfPresent([DigitalList].self, forKey: .digitalList)
        fixedDepositList = try values.decodeIfPresent([FixedDepositList].self, forKey: .fixedDepositList)
        messages = try values.decodeIfPresent([Messages].self, forKey: .messages)
    }
}


