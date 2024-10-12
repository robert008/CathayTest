//
//  AmountModel.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/10.
//

import Foundation

struct SavingsList : Codable {
    let account : String?
    let curr : String?
    let balance : Double?

    enum CodingKeys: String, CodingKey {

        case account = "account"
        case curr = "curr"
        case balance = "balance"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        account = try values.decodeIfPresent(String.self, forKey: .account)
        curr = try values.decodeIfPresent(String.self, forKey: .curr)
        balance = try values.decodeIfPresent(Double.self, forKey: .balance)
    }

}

struct DigitalList : Codable {
    let account : String?
    let curr : String?
    let balance : Double?

    enum CodingKeys: String, CodingKey {

        case account = "account"
        case curr = "curr"
        case balance = "balance"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        account = try values.decodeIfPresent(String.self, forKey: .account)
        curr = try values.decodeIfPresent(String.self, forKey: .curr)
        balance = try values.decodeIfPresent(Double.self, forKey: .balance)
    }

}

struct FixedDepositList : Codable {
    let account : String?
    let curr : String?
    let balance : Double?

    enum CodingKeys: String, CodingKey {

        case account = "account"
        case curr = "curr"
        case balance = "balance"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        account = try values.decodeIfPresent(String.self, forKey: .account)
        curr = try values.decodeIfPresent(String.self, forKey: .curr)
        balance = try values.decodeIfPresent(Double.self, forKey: .balance)
    }

}
