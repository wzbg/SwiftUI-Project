//
//  ModelProfile.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ModelProfile: Hashable {
  var icon: String
  var color: Color
  var title: String
  var messageCount: Int
}

let profileList = [
  ModelProfile(icon: "shift", color: .blue, title: "订 阅", messageCount: 0),
  ModelProfile(icon: "folder", color: .orange, title: "收 藏", messageCount: 99),
  ModelProfile(icon: "person", color: .yellow, title: "技 能", messageCount: 8),
  ModelProfile(icon: "square.and.arrow.down.on.square", color: .green, title: "下 载", messageCount: 0),
  ModelProfile(icon: "doc", color: .purple, title: "缓 存", messageCount: 0),
  ModelProfile(icon: "star", color: .red, title: "评 价", messageCount: 0),
]
