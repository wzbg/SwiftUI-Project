//
//  PageProfileSubscription.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageProfileSubscription: View {
  @State private var selectedItem = subscriptionList[0]
  
  var body: some View {
    VStack {
      SubPageTopTitle(title: "订 阅", subTitle: "雾の会员")
    }
  }
}

struct PageProfileSubscription_Previews: PreviewProvider {
  static var previews: some View {
    PageProfileSubscription()
  }
}
