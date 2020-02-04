//
//  ModelQuiz.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

struct ModelQuiz: Codable, Hashable {
  var title: String
  var subTitle: String
  var icon: String
  var correctRate: Int
  var submit: Int
  var starCount: Int
}

struct ModelQuizList: Codable {
  var items: [ModelQuiz]
}
