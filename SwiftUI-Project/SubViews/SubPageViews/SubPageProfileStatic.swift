//
//  SubPageProfileStatic.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SubPageProfileStatic: View {
  var body: some View {
    HStack {
      ProfileStaticCard(color: .blue, count: 20)
      ProfileStaticCard(color: .purple, count: 12)
      ProfileStaticCard(color: .orange, count: 122)
    }
  }
}

struct SubPageProfileStatic_Previews: PreviewProvider {
  static var previews: some View {
    SubPageProfileStatic()
  }
}

struct ProfileStaticCard: View {
  var color: Color
  var count: Int
  
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(color)
        .frame(width: 120, height: 60)
      Text("\(count)")
        .modifier(StaticText())
    }
  }
}
