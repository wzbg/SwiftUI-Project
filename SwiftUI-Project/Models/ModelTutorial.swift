//
//  ModelTutorial.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

enum TutorialStatus: String {
  case None = "circle"
  case Undone = "circle.lefthalf.fill"
  case Completed = "circle.fill"
}

struct ModelTutorial {
  var sequence: Int
  var status: TutorialStatus
  var title: String
  var subTitle: String
  var starCount: Int
  var fireCount: Int
  var favoriteCount: Int
}

let tutorialList = [
  ModelTutorial(
    sequence: 1,
    status: .None,
    title: "iOS开发从入门到精通",
    subTitle: "编程开发",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 2,
    status: .Undone,
    title: "Swift语言实例互动教程",
    subTitle: "编程开发",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 3,
    status: .Completed,
    title: "iOS开发中的神兵利器",
    subTitle: "编程开发",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 4,
    status: .None,
    title: "Objective-C应用开发",
    subTitle: "编程开发",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 5,
    status: .Undone,
    title: "SwiftUI从入门到实战",
    subTitle: "编程开发",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 6,
    status: .Completed,
    title: "Photoshop CC互动教程",
    subTitle: "平面设计",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 7,
    status: .None,
    title: "Illustrator CC互动教程",
    subTitle: "平面设计",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 8,
    status: .Undone,
    title: "Photoshop脚本互动教程",
    subTitle: "平面设计",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 9,
    status: .Completed,
    title: "Photoshop CS5互动教程",
    subTitle: "平面设计",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 10,
    status: .None,
    title: "Excel电子表格互动教程",
    subTitle: "办公软件",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 11,
    status: .Undone,
    title: "Word精美排版互动教程",
    subTitle: "办公软件",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 12,
    status: .Completed,
    title: "Pages办公快速入门",
    subTitle: "办公软件",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 13,
    status: .None,
    title: "IT职场中的实用工具",
    subTitle: "实用工具",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
  ModelTutorial(
    sequence: 14,
    status: .Undone,
    title: "非常实用的Chrome插件",
    subTitle: "实用工具",
    starCount: Int.random(in: 3...5),
    fireCount: Int.random(in: 120...200),
    favoriteCount: Int.random(in: 12...20)
  ),
]
