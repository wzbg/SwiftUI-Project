//
//  PageCategories.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/2.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageCategories: View {
  private let labels = [
    ("编程开发", 5),
    ("平面设计", 4),
    ("办公软件", 3),
    ("实用工具", 2),
  ]
  var title: String
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      SubPageTopTitle(title: title, subTitle: "总共 14 门课程")
      VStack(alignment: .leading, spacing: 12) {
        ForEach(0 ..< labels.count) {
          if $0 % 2 == 0 {
            CategoryRowView(
              firstLabel: "\(self.labels[$0].0)[\(self.labels[$0].1)]",
              secondLabel: "\(self.labels[$0+1].0)[\(self.labels[$0+1].1)]"
            )
          }
        }
      }.padding(.top, 30)
      .padding(.leading, 30)
      Spacer()
    }.modifier(SubPageContainer())
  }
}

struct PageCategories_Previews: PreviewProvider {
  static var previews: some View {
    PageCategories(title: "课程类别")
  }
}

struct CategoryRowView: View {
  var firstLabel: String
  var secondLabel: String
  var sequence = 1
  
  @State private var isAnimating = false
  
  var body: some View {
    HStack {
      NavigationLink(destination: PageTutorialList(title: firstLabel)) {
        Text(firstLabel)
          .modifier(CategoryLabel())
      }
      NavigationLink(destination: PageTutorialList(title: secondLabel)) {
        Text(secondLabel)
          .modifier(CategoryLabel())
      }
    }.modifier(SpringAnimationStyle(
      isAnimating: $isAnimating,
      delay: 0.2 + 0.05 * Double(sequence)
    ))
    .onAppear() {
      self.isAnimating = true
    }
  }
}
