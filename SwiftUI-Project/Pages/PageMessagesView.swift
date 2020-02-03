//
//  PageMessagesView.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/2.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageMessagesView: View {
  private let colors: [Color] = [.orange, .purple, .red, .green, .blue]
  @ObservedObject var model = FetchModelNewsList()
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      SubPageTopTitle(title: "新 闻", subTitle: "最多显示100条新闻")
      ScrollView {
        if model.items.count == 0 {
          Text("加载中...")
        } else {
          ForEach(0 ..< model.items.count) {
            SubPageMessageRow(
              model: self.model.items[$0],
              color: self.colors.randomElement()!,
              sequence: $0
            )
          }.padding(10)
        }
      }.padding(.leading, 25)
      }.modifier(SubPageContainer())
    .onAppear(perform: model.fetch)
  }
}

struct PageMessagesView_Previews: PreviewProvider {
  static var previews: some View {
    PageMessagesView()
  }
}
 

struct SubPageMessageRow: View {
  var model: ModelNews
  var color: Color
  var sequence: Int
  
   @State private var isAnimating = false
  
  var body: some View {
    HStack {
      Rectangle()
        .fill(Color.gray)
        .frame(
          minWidth: 1, idealWidth: 1, maxWidth: 1,
          minHeight: 120, idealHeight: 100, maxHeight: 1000,
          alignment: .leading
        )
      HStack(alignment: .top, spacing: 0) {
        Circle()
          .fill(color)
          .frame(width: 15, height: 15, alignment: .center)
          .offset(x: -16, y: 2)
        VStack(alignment: .leading, spacing: 10) {
          HStack(alignment: .top) {
            Text(model.title)
              .font(.system(size: 15))
              .modifier(RegularTitle())
            Spacer()
            Image(systemName: "calendar")
              .modifier(SmallText())
              .offset(x: 0, y: 5)
            Text(model.postDate)
              .modifier(SmallText())
          }
          Text(model.subTitle)
            .modifier(SmallText())
        }
      }
    }.padding(.bottom, -10)
    .modifier(SpringAnimationStyle(
      isAnimating: $isAnimating,
      delay: 0.3 + 0.1 * Double(sequence)
    ))
    .onAppear() {
      self.isAnimating = true
    }
  }
}
