//
//  PageAssistant.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageAssistant: View {
  @State private var newMessage = ""
  @State private var isPresented = false
  
  @ObservedObject var model = FetchModelMessageList()
  
  var alert: Alert {
    Alert(title: Text("请输入信息"))
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      SubPageTopTitle(title: "个人顾问", subTitle: "遇到问题请留言", withArrow: false)
        .padding(.leading, 20)
        .padding(.bottom, 20)
      if model.items.count == 0 {
        Text("加载中...")
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          ForEach(0 ..< model.items.count) {
            Text("\($0)")
          }.padding(10)
        }.padding(.leading, 25)
      }
    }.modifier(SubPageContainer())
    .onAppear(perform: model.fetch)
  }
}

struct PageAssistant_Previews: PreviewProvider {
  static var previews: some View {
    PageAssistant()
  }
}
