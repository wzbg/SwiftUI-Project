//
//  PageTestDetail.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageTestDetail: View {
  @ObservedObject var model = FetchModelQuizDetailList()
  
  @State private var selectedItem = 0
  @State private var totalCorrect = 0
  @State private var totalInCorrect = 0
  
  @State private var isAnimating = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      SubPageTopTitle(title: "返回", subTitle: "")
      if model.items.count == 0 {
        Text("加载中...")
      } else {
        HStack {
          Text(model.item!.question)
            .modifier(MiddleTitle())
            .lineLimit(nil)
            .padding(.bottom, 15)
            .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
          Spacer()
        }
        VStack(alignment: .leading, spacing: 20) {
          ForEach(0 ..< model.item!.option.count) { i in
            Text("\(i).\(self.model.item!.option[i]))")
              .multilineTextAlignment(.leading)
              .modifier(RegularTitleOption(isHighlight: self.selectedItem == i+1))
              .onTapGesture {
                self.selectedItem = i + 1
              }
          }
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
        HStack(spacing: 20) {
          Text("正确：\(totalCorrect)")
          Text("错误：\(totalInCorrect)")
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.7))
        .modifier(RegularTitle())
        .padding(.top, 25)
        HStack(spacing: 20) {
          Button("提 交") {
            if self.model.item!.answer == self.selectedItem {
              self.totalCorrect += 1
            } else {
              self.totalInCorrect += 1
            }
            self.selectedItem = 0
            self.model.getItem()
          }.modifier(CommonButton(isEnable: selectedItem > 0))
          .disabled(selectedItem == 0)
          Button("分 享") {
            print("分享这道题")
          }.modifier(CommonButton(isEnable: true))
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.8))
      }
      Spacer()
    }.modifier(SubPageContainer())
    .onAppear() {
      self.model.fetch()
      self.isAnimating = true
    }
  }
}

struct PageTestDetail_Previews: PreviewProvider {
  static var previews: some View {
    PageTestDetail()
  }
}
