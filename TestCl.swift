//
//  TestCl.swift
//  AsgntTendable
//
//  Created by Suprabha Dhavan on 30/07/24.
//

import UIKit

//class TestCl: NSObject {
//
//}

struct Area: Codable {
    let id: Int
    let name: String
enum CodingKeys: String, CodingKey {
        case id, name
    }
}
struct Category: Codable {
    let nameCategory: String
}
struct Inspection: Codable {
    let idI: Int
    let nameI: String
    let accessI: String
}
struct Question: Codable {
    let idQ: Int
    let nameQ: String
    let answerChoice: AnswerChoice
}

struct AnswerChoice: Codable {
    let idAC: Int
    let nameAC: String
    let score: Double
}
