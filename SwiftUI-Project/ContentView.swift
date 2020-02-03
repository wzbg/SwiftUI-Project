//
//  ContentView.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/2.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      PageViewIndex()
        .tabItem {
          Image(systemName: "house.fill")
          Text("首页")
        }
      PageTestList()
        .tabItem {
          Image(systemName: "pencil.and.ellipsis.rectangle")
          Text("刷题")
        }
      PageAssistant()
        .tabItem {
          Image(systemName: "bubble.left.and.bubble.right.fill")
          Text("客服")
        }
      PageProfile()
        .tabItem {
          Image(systemName: "gear")
          Text("档案")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
