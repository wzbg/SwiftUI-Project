//
//  ModelSubscription.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import Foundation

struct ModelSubscription: Hashable {
  var type: String
  var price: Int
  var dateRange: String
}

let subscriptionList = [
  ModelSubscription(type: "年卡会员", price: 218, dateRange: "365 天"),
  ModelSubscription(type: "季卡会员", price: 58, dateRange: "90 天"),
  ModelSubscription(type: "月卡会员", price: 25, dateRange: "30 天"),
]
