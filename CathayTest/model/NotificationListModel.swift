//
//  NotificationListModel.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/9.
//

import UIKit
import Foundation

// 定義模型結構體
struct Response: Codable {
    let msgCode: String
    let msgContent: String
    let result: ResultData
}

struct ResultData: Codable {
    let messages: [NotificationMessage]
}

struct NotificationMessage: Codable {
    let status: Bool
    let updateDateTime: Date
    let title: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case updateDateTime
        case title
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Bool.self, forKey: .status)
        title = try container.decode(String.self, forKey: .title)
        message = try container.decode(String.self, forKey: .message)
        
        let dateString = try container.decode(String.self, forKey: .updateDateTime)
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "HH:mm:ss yyyy/MM/dd"
        
        if let date = dateFormatter1.date(from: dateString) {
            updateDateTime = date
        } else if let date = dateFormatter2.date(from: dateString) {
            updateDateTime = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .updateDateTime, in: container, debugDescription: "Date string does not match any expected format")
        }
    }
}

