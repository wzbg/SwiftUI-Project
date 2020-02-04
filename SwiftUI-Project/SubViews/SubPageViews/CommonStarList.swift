//
//  CommonStarList.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct CommonStarList: View {
  var level: Int
  
  var body: some View {
    HStack(alignment: .center, spacing: 0) {
      ForEach(0 ..< level) { _ in
        Image(systemName: "star.fill")
          .modifier(LittleStar())
      }
      ForEach(level ..< 5) { _ in
        Image(systemName: "star")
          .modifier(LittleStar())
      }
    }
  }
}

struct CommonStarList_Previews: PreviewProvider {
  static var previews: some View {
    CommonStarList(level: 4)
  }
}
