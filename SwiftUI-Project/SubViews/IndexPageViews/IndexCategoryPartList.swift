//
//  IndexCategoryPartList.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/2.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct IndexCategoryPartList: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("课程类别")
        .font(.system(size: 16))
        .padding(.leading, 20)
        .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
      ZStack {
        RoundedRectangle(cornerRadius: 8)
          .fill(LinearGradient(
            gradient: Gradient(colors: [
              Color(red: 255/255, green: 122/255, blue: 109/255),
              Color(red: 229/255, green: 193/255, blue: 113/255)]),
            startPoint: .leading,
            endPoint: .trailing))
          .offset(x: 20, y: 0)
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .center, spacing: 30) {
            NavigationLink(destination: PageCategories(title: "设 计")) {
              VStack {
                Image(systemName: "pencil.and.outline")
                  .font(.system(size: 60))
                  .padding(.bottom, 20)
                Text("设 计")
                  .font(.system(size: 14))
              }
            }
            NavigationLink(destination: PageCategories(title: "编 程")) {
              VStack {
                Image(systemName: "keyboard")
                  .font(.system(size: 60))
                  .padding(.bottom, 20)
                Text("编 程")
                  .font(.system(size: 14))
              }
            }
            NavigationLink(destination: PageCategories(title: "办 公")) {
              VStack {
                Image(systemName: "doc.on.doc")
                  .font(.system(size: 60))
                  .padding(.bottom, 20)
                Text("办 公")
                  .font(.system(size: 14))
              }
            }
            NavigationLink(destination: PageCategories(title: "其 他")) {
              VStack {
                Image(systemName: "globe")
                  .font(.system(size: 60))
                  .padding(.bottom, 20)
                Text("其 他")
                  .font(.system(size: 14))
              }
            }
          }.foregroundColor(.white)
          .padding(.vertical, 20)
        }.offset(x: 30, y: 0)
        .cornerRadius(5)
      }
    }.padding(.top, 10)
  }
}

struct IndexCategoryPartList_Previews: PreviewProvider {
  static var previews: some View {
    IndexCategoryPartList()
  }
}
