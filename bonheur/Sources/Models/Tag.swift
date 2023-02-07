//
//  Tag.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/07.
//

import Foundation

struct Tag {
    var tagID: Int
    var content: String
    
    init(tagID: Int, content: String) {
        self.tagID = tagID
        self.content = content
    }
}
