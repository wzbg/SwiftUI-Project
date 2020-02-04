//
//  SubPageProfileRow.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SubPageProfileRow: View {
  var model: ModelProfile
  
  var body: some View {
    HStack {
      ZStack {
        CircleBackGround(color: model.color)
        Image(systemName: model.icon)
          .foregroundColor(.white)
      }
      Text(model.title)
        .modifier(RegularTitle())
      Spacer()
      if model.messageCount > 0 {
        ZStack {
          CircleBackGround()
          Text("\(model.messageCount)")
            .foregroundColor(.white)
            .modifier(RegularTitle())
        }
      }
      Image(systemName: "chevron.right")
        .modifier(BigTitle())
    }.padding(.vertical, 6)
  }
}

struct SubPageProfileRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SubPageProfileRow(model: profileList[0])
      SubPageProfileRow(model: profileList[1])
    }
  }
}

struct CircleBackGround: View {
  var color: Color = .orange
  
  var body: some View {
    Circle()
      .fill(color)
      .frame(width: 30, height: 30)
  }
}
