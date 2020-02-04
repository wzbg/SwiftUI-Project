//
//  PageTestList.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageTestList: View {
  @ObservedObject var model = FetchModelQuizList()
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading, spacing: 0) {
        SubPageTopTitle(title: "刷 题", subTitle: "数千道题来提高你的技能", withArrow: false)
        if model.items.count == 0 {
          Text("加载中...")
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            ForEach(0 ..< model.items.count) { i in
              NavigationLink(destination: PageTestDetail()) {
                SubPageTestRow(model: self.model.items[i], sequence: i)
              }
            }.padding(10)
          }.padding(.leading, 25)
        }
      }.modifier(SubPageContainer())
      .onAppear(perform: model.fetch)
    }
  }
}

struct PageTestList_Previews: PreviewProvider {
  static var previews: some View {
    PageTestList()
  }
}
