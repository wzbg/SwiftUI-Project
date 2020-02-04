//
//  SubPageProfileVipSet.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SubPageProfileVipSet: View {
  var item: ModelSubscription
  var isActive = false
  
  var body: some View {
    ZStack {
      if isActive {
        RoundedRectangle(cornerRadius: 5)
          .stroke(lineWidth: 1)
          .fill(Color(red: 255/255, green: 123/255, blue: 109/255))
        VStack(alignment: .center, spacing: 10) {
          Text(item.type)
            .modifier(VipDateTitleEnable())
          HStack(alignment: .firstTextBaseline, spacing: 5) {
            Text("¥")
              .modifier(VipDateCurrencyEnable())
            Text("\(item.price)")
              .modifier(VipDatePriceEnable())
          }.padding(.vertical, 5)
          Text(item.dateRange)
            .modifier(VipDateRangeEnable())
        }
      } else {
        RoundedRectangle(cornerRadius: 5)
          .stroke(lineWidth: 1)
          .fill(Color.black.opacity(0.3))
        VStack(alignment: .center, spacing: 10) {
          Text(item.type)
            .modifier(VipDateTitleDisable())
          HStack(alignment: .firstTextBaseline, spacing: 5) {
            Text("¥")
              .modifier(VipDateCurrencyDisable())
            Text("\(item.price)")
              .modifier(VipDatePriceDisable())
          }.padding(.vertical, 5)
          Text(item.dateRange)
            .modifier(VipDateRangeDisable())
        }
      }
    }
  }
}

struct SubPageProfileVipSet_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      SubPageProfileVipSet(item: subscriptionList[0], isActive: true)
      SubPageProfileVipSet(item: subscriptionList[1])
    }
  }
}
