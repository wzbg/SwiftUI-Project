//
//  PageProfileDownload.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageProfileDownload: View {
  @State private var isAnimating = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      SubPageTopTitle(title: "资源下载", subTitle: "仅需一次")
      VStack(alignment: .leading, spacing: 30) {
        VStack(alignment: .leading) {
          Text("应用程序网址")
            .modifier(RedNumber())
          Text("https://itunes.apple.com/cn/app/id1392811165")
            .modifier(RegularTitle())
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
        VStack(alignment: .leading) {
          Text("课程素材网址")
            .modifier(RedNumber())
          Text("https://github.com/fzhlee")
            .modifier(RegularTitle())
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
        VStack(alignment: .leading) {
          Text("客服服务网址")
            .modifier(RedNumber())
          Text("https://www.hdjc8.com")
          .modifier(RegularTitle())
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.5))
        VStack(alignment: .leading) {
          Text("QQ客服网址")
            .modifier(RedNumber())
          Text("3068527144")
          .modifier(RegularTitle())
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
      }.padding(.top, 10)
      .padding(.leading, 30)
      Spacer()
    }.modifier((SubPageContainer()))
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct PageProfileDownload_Previews: PreviewProvider {
  static var previews: some View {
    PageProfileDownload()
  }
}
