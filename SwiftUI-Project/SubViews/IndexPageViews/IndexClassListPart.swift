//
//  IndexClassListPart.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/2.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct IndexClassListPart: View {
  @EnvironmentObject var status: ModelStatus
  @State var shouldPushClassList = false
  
  var classImageList = [
    "xmark",
    "strikethrough",
    "x.circle",
    "o.circle",
    "u.circle",
  ]
  var classNameList = [
    "iOS开发从入门到精通",
    "Swift语言实例互动教程",
    "iOS开发中的神兵利器",
    "Objective-C应用开发",
    "SwiftUI从入门到实战",
  ]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("课程类别")
        .font(.system(size: 16))
        .padding(.leading, 20)
        .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
        .offset(x: 0, y: 16)
      ScrollView(.horizontal, showsIndicators: false) {
        NavigationLink(destination: PageClassList(), isActive: $shouldPushClassList) {
          HStack {
            ForEach(0 ..< classNameList.count) { i in
              VStack {
                Image(systemName: self.classImageList[i])
                  .font(.system(size: 101))
                Text(self.classNameList[i])
                  .font(.system(size: 14))
                  .multilineTextAlignment(.center)
                  .offset(x: 0, y: 40)
              }.frame(width: 201, height: 201)
              .background(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
              .onTapGesture {
                self.status.tempStringValue = self.classNameList[i]
                self.shouldPushClassList = true
              }
            }.foregroundColor(.gray)
          }
        }.padding(.top, 10)
      }.padding(.leading, 20)
    }.padding(.top, 4)
  }
}

struct IndexClassListPart_Previews: PreviewProvider {
  static var previews: some View {
    IndexClassListPart()
  }
}
