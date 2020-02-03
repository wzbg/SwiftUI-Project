//
//  HistoryTutorialView.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/2.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct HistoryTutorialView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      SubPageTopTitle(title: "最近学习的课程", subTitle: "最多显示100门课程")
      ScrollView {
        ForEach(tutorialList, id: \.sequence) { tutorial in
          NavigationLink(destination: PageTutorialDetail()) {
            TutorialRow(tutorial: tutorial)
          }
        }
      }.padding(.top, 20)
      .offset(x: 30, y: 0)
    }.modifier(SubPageContainer())
  }
}

struct HistoryTutorialView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryTutorialView()
  }
}
