//
//  PageProfileSubscription.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageProfileSubscription: View {
  @State private var selectedType = subscriptionList[0].type
  @State private var isAnimating = false
  
  var body: some View {
    VStack {
      SubPageTopTitle(title: "订 阅", subTitle: "雾の会员")
      HStack(spacing: 10) {
        ForEach(subscriptionList, id: \.self) { item in
          SubPageProfileVipSet(item: item, isActive: self.selectedType == item.type)
            .onTapGesture {
              self.selectedType = item.type
            }
        }
      }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
      .frame(width: screenWidth - 60, height: 160, alignment: .center)
      .padding(.top, 10)
      VStack(alignment: .leading, spacing: 10) {
        HStack {
          Text("你的选择")
          Spacer()
          Text("\(selectedType)")
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
        HStack {
          Text("日期范围")
          Spacer()
          Text("\(subscriptionList.first() { $0.type == self.selectedType }!.dateRange)")
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.5))
        HStack {
          Text("解锁所有课程")
          Spacer()
          Text("是")
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
        HStack {
          Text("解锁所有题库")
          Spacer()
          Text("是")
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.7))
        HStack {
          Text("持续更新")
          Spacer()
          Text("是")
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.8))
        HStack {
          Text("客服服务")
          Spacer()
          Text("是")
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.9))
        HStack {
          Text("联系素材")
          Spacer()
          Text("是")
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 1))
      }.frame(width: screenWidth - 60)
      .padding(.top, 20)
      .modifier(RegularTitle())
      Spacer()
      VStack {
        Button("立即支付") {
          print("购买\(self.selectedType)")
        }.font(.system(size: 20))
        .frame(width: screenWidth - 60, height: 50)
        .background(Color(red: 255/255, green: 123/255, blue: 109/255))
        .foregroundColor(.white)
        .cornerRadius(5)
        .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 1.1))
        HStack {
          Button("恢复购买") {
            print("恢复购买")
          }
          Spacer()
          Button("隐私政策") {
            print("隐私政策")
          }
        }.frame(width: screenWidth - 60)
        .padding(.top, 10)
        .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 1.2))
      }.modifier(RegularTitle())
      Spacer()
    }.modifier(SubPageContainer())
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct PageProfileSubscription_Previews: PreviewProvider {
  static var previews: some View {
    PageProfileSubscription()
  }
}
