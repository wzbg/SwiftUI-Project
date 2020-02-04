//
//  ModelQuizDetail.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

struct ModelQuizDetail: Codable, Hashable {
  var question: String
  var options: [String]
  var answer: Int
}

struct ModelQuizDetailList: Codable {
  var items: [ModelQuizDetail]
}
