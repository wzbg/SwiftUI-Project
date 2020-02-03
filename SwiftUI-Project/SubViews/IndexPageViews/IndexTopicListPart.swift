//
//  IndexTopicListPart.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct IndexTopicListPart: View {
  let topicsImageList = [
     "hero_6_0",
     "hero_6_12",
     "hero_6_13",
     "hero_6_14",
     "hero_6_16",
   ]
  let topicsNameList = [
     "iOS开发从入门到精通",
     "Swift语言实例互动教程",
     "iOS开发中的神兵利器",
     "Objective-C应用开发",
     "SwiftUI从入门到实战",
   ]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("热门话题")
        .font(.system(size: 16))
        .padding(.leading, 20)
        .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
        .offset(x: 0, y: 16)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(0 ..< topicsNameList.count) { i in
            NavigationLink(
              destination: PageTutorialList(title: self.topicsNameList[i])
            ) {
              ZStack(alignment: .bottom) {
                Image(self.topicsImageList[i])
                  .renderingMode(.original)
                  .resizable()
                  .scaledToFit()
                  .frame(height: 100)
                Text(self.topicsNameList[i])
                  .foregroundColor(.white)
                  .padding(.bottom, 5)
              }
            }
          }
        }.padding(.vertical, 10)
      }.padding(.leading, 20)
    }
  }
}

struct IndexTopicListPart_Previews: PreviewProvider {
  static var previews: some View {
    IndexTopicListPart()
  }
}
