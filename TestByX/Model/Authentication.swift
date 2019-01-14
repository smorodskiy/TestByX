//
//  PostToken.swift
//  TestByX
//
//  Created by Igor on 12.01.2019.
//  Copyright © 2019 Dejavu. All rights reserved.
//

import Foundation


private enum CodingKeys: String, CodingKey {
    case duration = "duration"
    case token = "token"
}

struct PostToken {
    let duration: Int
    let token: String
}

extension PostToken: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.duration = try container.decode(Int.self, forKey: .duration)
        self.token = try container.decode(String.self, forKey: .token)
    }
}
