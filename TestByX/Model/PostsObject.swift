//
//  PostModel.swift
//  TemplateProject
//

import Foundation

private enum CodingKeys: String, CodingKey {
    case postId = "id"
    case title = "title"
    case text = "text"
    case datePublic = "datePublic"
}

struct SinglePostObject {
    let postId: Int
    let title: String
    let text: String
    let datePublic: String
}

extension SinglePostObject: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.postId = try container.decode(Int.self, forKey: .postId)
        self.title = try container.decode(String.self, forKey: .title)
        self.text = try container.decode(String.self, forKey: .text)
        self.datePublic = try container.decode(String.self, forKey: .datePublic)
    }
}
