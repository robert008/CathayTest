//
//  BannerModel.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/11.
//

import Foundation



struct BannerList : Codable {
    let adSeqNo : Int?
    let linkUrl : String?

    enum CodingKeys: String, CodingKey {

        case adSeqNo = "adSeqNo"
        case linkUrl = "linkUrl"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adSeqNo = try values.decodeIfPresent(Int.self, forKey: .adSeqNo)
        linkUrl = try values.decodeIfPresent(String.self, forKey: .linkUrl)
    }

}

