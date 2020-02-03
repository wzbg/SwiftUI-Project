//
//  IndexTopBarPart.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/2.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct IndexTopBarPart: View {
  @State private var tutorialName = ""
  @State var isActive = false
  @State var shouldShowAlert = false
  
  var body: some View {
    HStack {
      NavigationLink(destination: HistoryTutorialView()) {
        Image(systemName: "list.bullet")
          .font(.system(size: 22))
          .foregroundColor(.gray)
      }
      Spacer()
        .frame(width: 20)
      ZStack(alignment: .trailing) {
        RoundedRectangle(cornerRadius: 5)
          .stroke(lineWidth: 1)
          .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
          .frame(height: 30)
        TextField("教程名称", text: $tutorialName)
          .padding(5)
          .cornerRadius(5)
          .font(.system(size: 14))
        NavigationLink(destination: FilterTutorialView(keyword: tutorialName), isActive: $isActive) {
          Text("")
        }
        Image(systemName: "magnifyingglass")
          .font(.system(size: 15))
          .foregroundColor(.gray)
          .padding(.trailing, 10)
          .onTapGesture {
            if self.tutorialName.isEmpty {
              self.shouldShowAlert = true
            } else {
              self.isActive = true
              self.shouldShowAlert = false
            }
          }
          .alert(isPresented: $shouldShowAlert) {
            .init(
              title: Text("警告"),
              message: Text("请先输入搜索词"),
              dismissButton: .default(Text("好的")) {}
            )
          }
      }
      Spacer()
        .frame(width: 20)
      NavigationLink(destination: PageMessagesView()) {
        Image(systemName: "3.circle.fill")
          .foregroundColor(.red)
          .font(.system(size: 24))
      }
    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
  }
}

struct IndexTopBarPart_Previews: PreviewProvider {
  static var previews: some View {
    IndexTopBarPart()
  }
}
