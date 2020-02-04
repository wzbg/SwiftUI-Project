//
//  ModelMessage.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

struct ModelMessage: Codable, Hashable {
  var message: String
  var postDate: String
  var isFromUser: Int
}

struct ModelMessageList: Codable {
  var items: [ModelMessage]
}
