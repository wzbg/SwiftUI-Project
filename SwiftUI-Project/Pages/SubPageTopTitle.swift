//
//  SubPageTopTitle.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SubPageTopTitle: View {
  var title: String
  var subTitle: String
  var withArrow = true
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @State private var isAnimating = false
  
  var body: some View {
    HStack(alignment: .top) {
      if withArrow {
        Image(systemName: "arrow.left")
          .font(.system(size: 20))
          .offset(x: 0, y: 8)
          .padding(.trailing, 5)
          .modifier(SpringAnimationStyle(isAnimating: $isAnimating))
          .onTapGesture {
            self.presentationMode.wrappedValue.dismiss()
          }
      }
      VStack(alignment: .leading, spacing: 0) {
        Text(title)
          .modifier(BigTitle())
          .padding(.bottom, 5)
          .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.1))
        Text(subTitle)
          .fontWeight(.light)
          .modifier(SubTitle())
          .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
      }
      Spacer()
    }.frame(width: screenWidth - 40)
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct SubPageTopTitle_Previews: PreviewProvider {
    static var previews: some View {
        SubPageTopTitle(title: "主标题", subTitle: "副标题")
    }
}
