//
//  NotificationModel.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/12.
//

import Foundation

struct Messages : Codable {
    let status : Bool?
    let updateDateTime : String?
    let title : String?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case updateDateTime = "updateDateTime"
        case title = "title"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        updateDateTime = try values.decodeIfPresent(String.self, forKey: .updateDateTime)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
