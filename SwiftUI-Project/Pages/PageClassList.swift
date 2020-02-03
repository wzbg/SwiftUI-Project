//
//  PageClassList.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/2.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

private let chapterTitles = [
  "基础控件",
  "实用控件",
  "页面布局",
  "漂亮动画",
  "交互操作",
  "页面跳转",
  "项目实战",
  "精彩实例",
  "完整项目",
]

struct PageClassList: View {
  @EnvironmentObject var status: ModelStatus
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      SubPageTopTitle(
        title: status.tempStringValue,
        subTitle: "总共 \(chapterTitles.count) 个章节"
      )
      SubPageChapterView(parentView: self)
        .padding(.vertical, 20)
        .offset(x: 27, y: 0)
      ScrollView {
        ForEach(tutorialList, id: \.sequence) { tutorial in
          NavigationLink(destination: PageTutorialDetail()) {
            TutorialRow(tutorial: tutorial)
          }
        }
      }.offset(x: 30, y: 0)
    }.modifier(SubPageContainer())
  }
  
  func resetTutorialList() {
    // 重置课程列表
  }
}

struct PageClassList_Previews: PreviewProvider {
  static var previews: some View {
    let globalModel = ModelStatus()
    globalModel.tempStringValue = "SwiftUI从入门到实战"
    return PageClassList().environmentObject(globalModel)
  }
}

struct SubPageChapterView: View {
  var parentView: PageClassList
  @State var selectedItem = 1
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 0) {
        ForEach(1 ..< chapterTitles.count) { i in
          ZStack(alignment: .leading) {
            Image(i == self.selectedItem ? "hero_6_1" : "hero_6_5")
              .resizable()
              .scaledToFit()
              .frame(height: 120)
              .cornerRadius(5)
              .padding(5)
            VStack(alignment: .leading, spacing: 10) {
              Text(chapterTitles[i-1])
                .font(.system(size: 15))
              Text("\(i)")
                .font(.system(size: 64))
            }.offset(x: 20, y: 0)
            .foregroundColor(.white)
          }.onTapGesture {
            self.selectedItem = i
            self.parentView.resetTutorialList()
          }
        }
      }
    }
  }
}
