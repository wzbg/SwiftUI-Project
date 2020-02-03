//
//  PageViewIndex.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageViewIndex: View {
  @State private var isAnimating = false
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          IndexTopBarPart()
            .modifier(SpringAnimationStyle(isAnimating: $isAnimating))
          IndexCategoryPartList()
            .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
          IndexClassListPart()
            .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
          IndexTopicListPart()
            .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
        }
      }.navigationBarTitle("")
      .navigationBarHidden(true)
      .padding(.top, 20)
    }.onAppear() {
      self.isAnimating = true
    }
  }
}

struct PageViewIndex_Previews: PreviewProvider {
  static var previews: some View {
    PageViewIndex()
  }
}
